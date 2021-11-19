<template>
    <div>
        <!-- Modal Component -->
        <b-modal header-text-variant="light" header-bg-variant="dark" footer-bg-variant="dark" centered
                 v-model="open_modal.modal_status" @close="closeModal" :size="modal_size" body-class="p-0"
                 no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5 v-if="form_data.id==-1"><i class='fa fa-plus-circle'></i>&nbsp;&nbsp;Add New Record<span></span></h5>
                    <h5 v-else><i class='fa fa-pencil'></i>&nbsp;&nbsp;Update Record<span></span></h5>
                </div>
            </template>
            <b-row align-v="center" class="modal-loader" v-if="is_saving">
                <b-col>
                    <b-spinner></b-spinner>
                    <br><br>
                    <strong>Loading</strong>
                </b-col>
            </b-row>
            <div class="custom-modal-body">
                <b-card class="mb-0">
                    <div slot="header">
                        <b-row>
                            <b-col sm="5" class="d-flex align-items-center">
                                <div>
                                    <strong>Fill in the form</strong>
                                </div>
                            </b-col>
                        </b-row>
                    </div>
                    <b-form-group
                            :description="errors.has('name') ? '' : '*This field is required.'"
                            :invalid-feedback="!errors.has('name') ? '' : '*'+errors.first('name')"
                            :state="false"
                            label="Cabin Type Name"
                            label-for="name"
                            class="mb-0"
                    >
                        <input type="text" class="form-control" v-model="form_data.name" v-validate="'required'" id="name" name="name" v-bind:class="{ 'is-invalid': errors.has('name') }">
                    </b-form-group>

                    <b-form-group
                            :description="errors.has('description') ? '' : '*This field is required.'"
                            :invalid-feedback="!errors.has('description') ? '' : '*'+errors.first('description')"
                            :state="false"
                            label="Cabin Type Description"
                            label-for="description"
                            class="mb-0 mt-3"
                    >
                        <input type="text" class="form-control" v-model="form_data.description" v-validate="'required'" id="description" name="description" v-bind:class="{ 'is-invalid': errors.has('description') }">
                    </b-form-group>
                    <!--<div class="form-group mb-0" size="sm">-->
                        <!--<label for="name">Boat Model Name</label>-->
                    <!--</div>-->
                </b-card>
            </div>
            <div slot="modal-footer" class="w-100">
                <div class="float-right">
                    <b-row >
                        <b-col>
                            <b-button variant="success" disabled v-if="is_saving" size="sm">
                                <template>
                                    <b-spinner small type="grow"></b-spinner>
                                    Saving Data...
                                </template>
                            </b-button>
                            <b-button
                                    variant="success"
                                    class="float-right"
                                    size="sm"
                                    v-else
                                    @click="save"
                            >
                                <i class="fa fa-save"></i> Save & Exit
                            </b-button>
                        </b-col>
                    </b-row>


                </div>

            </div>
        </b-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js'
    import SwalMixin from '@/views/mixins/Swal.js'
    import BCol from "bootstrap-vue/src/components/layout/col";

    export default {
        name: 'form-modal',
        components: {BCol},
        inheritAttrs: false,
        mixins:[SwalMixin],
        props: {
            open_modal: {
                type: [Array, Object],
                default: () => []
            },
            form_data: {
                type: [Array, Object],
                default: () => []
            },
            modal_size: {
                type: String,
                required: false,
                default: 'md'
            },
            header_title: {
                type: String,
                required: false,
                default: 'md'
            }
        },
        data() {
            return {
                is_saving: false,
            }
        },
        mounted() {
            //console.log(this.swal_confirm_details);

            //console.log(this.form_data);
        },
        methods: {
            closeModal() {
                bus.$emit('formModalClose');
            },
            transactionCompleted() {
                bus.$emit('formModalTransactionCompleted');
            },
            save(){
                this.swalConfirmSubmit((data)=>{
                    if (data.value) {
                        this.$validator.validateAll().then(result=>{
                            if(result){
                                this.is_saving=true;
                                this.axios.post('maintenance/cabin_types/save',this.form_data).then(response => {
                                    this.closeModal();
                                    this.transactionCompleted();
                                    this.swalTransactionCompleted();
                                    this.is_saving=false;
                                }).catch(error => {
                                    this.swalRequestError();
                                    this.is_saving=false;
                                });
                            }else{
                                this.swalFieldsRequired();
                            }
                        });
                    }
                });
            }
        }
    }
</script>
