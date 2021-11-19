<template>
    <div>
        <b-form @submit.prevent="save">
            <b-row class="mb-2">
                <b-col md="4">
                    <b-form-group
                            :description="errors.has('old_password') || old_password_response.length > 0 ? '' : '* This field is required.'"
                            :invalid-feedback="!errors.has('old_password') ? old_password_response.length > 0 ? 'Incorrect Password!' : '' : '*'+ 'The old password is required.'"
                            :state="false"
                            label="Old Password"
                            label-for="old_password"
                            class="mb-0 font-weight-bold"
                    >
                        <b-form-input type="password" class="form-control" v-model="old_password"
                                      v-validate="'required'"
                                      id="old_password" name="old_password"
                                      debounce="1000"
                                      trim
                                      v-bind:class="{ 'is-invalid': errors.has('old_password') || old_password_response.length > 0 }">
                        </b-form-input>
                    </b-form-group>
                </b-col>
            </b-row>
            <b-row class="mb-3">
                <b-col md="4">
                    <b-form-group
                            :description="errors.has('new_password') ? '' : '* This field is required.'"
                            :invalid-feedback="!errors.has('new_password') ? '' : '*'+ errors.first('new_password').replace(/_/g, ' ')"
                            :state="false"
                            label="New Password"
                            label-for="new_password"
                            class="mb-0 font-weight-bold"
                    >
                        <b-form-input type="password" class="form-control" v-model="new_password"
                                      v-validate="'required|min:8'"
                                      id="new_password" name="new_password" ref="new_password"
                                      v-bind:class="{ 'is-invalid': errors.has('new_password') }">
                        </b-form-input>
                    </b-form-group>
                </b-col>
            </b-row>
            <b-row class="mb-3">
                <b-col md="4">
                    <b-form-group
                            :description="errors.has('retype_new_password') ? '' : '* This field is required.'"
                            :invalid-feedback="!errors.has('retype_new_password') ? '' : '*'+ errors.first('retype_new_password').replace(/_/g, ' ')"
                            :state="false"
                            label="Re-type New Password"
                            label-for="retype_new_password"
                            class="mb-0 font-weight-bold"
                    >
                        <b-form-input type="password" class="form-control" v-model="retype_new_password"
                                      v-validate="'required|min:8|confirmed:new_password'"
                                      id="retype_new_password" name="retype_new_password"
                                      v-bind:class="{ 'is-invalid': errors.has('retype_new_password') }">
                        </b-form-input>
                    </b-form-group>
                </b-col>
            </b-row>
            <b-row class="mb-3">
                <b-col md="4">
                    <b-button variant="success" disabled v-if="is_saving" size="sm">
                        <template>
                            <b-spinner small type="grow"></b-spinner>
                            Saving Data...
                        </template>
                    </b-button>
                    <b-button
                            variant="success"
                            class="float-right"
                            size="md"
                            v-else
                            type="submit"
                    >
                        <i class="fa fa-save"></i> Save Password
                    </b-button>
                </b-col>
            </b-row>
        </b-form>
    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js'
    export default {
        name: "Index",
        mixins:[SwalMixin],
        watch: {
            old_password: {
                handler(val) {
                    if (val != '') {
                        this.validateOldPassword(val);
                    }else{
                        this.old_password_response = '';
                    }
                },
                deep: true
            }
        },
        data() {
            return {
                is_saving: false,
                old_password: '',
                old_password_response: '',
                new_password: '',
                retype_new_password: '',
            }
        },
        methods: {
            save(){
                this.swalConfirmSubmit((data)=>{
                    if (data.value) {
                        this.$validator.validateAll().then(result=>{
                            if(result && this.old_password_response.length == 0){
                                this.is_saving=true;
                                this.axios.post('maintenance/user/save_new_password', {
                                    old_password: this.old_password,
                                    password: this.new_password,
                                    password_confirmation: this.retype_new_password
                                }).then(response => {
                                    this.swalTransactionCompleted();
                                    this.is_saving=false;
                                }).catch(error => {
                                    this.swalRequestError();
                                    this.is_saving=false;
                                });
                            }else{
                                this.swal_transaction_error_data.text = "Fill up required fields!"
                                this.swalRequestError();
                            }
                        });
                    }
                });
            },
            validateOldPassword(val) {
                this.axios.post('maintenance/user/validate_password', {password: this.old_password}).then(
                    response => {
                        this.old_password_response = '';
                    }
                ).catch(error => {
                    this.old_password_response = 'error';
                });
            }
        }
    }
</script>

<style scoped>

</style>