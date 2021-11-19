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
                            :description="errors.has('description') ? '' : '*This field is required.'"
                            :invalid-feedback="!errors.has('description') ? '' : '*'+errors.first('description')"
                            :state="false"
                            label="Exclusion Description"
                            label-for="description"
                            class="mb-4"
                    >
                        <input type="text" class="form-control" v-model="form_data.description" v-validate="'required'" id="description" name="description" v-bind:class="{ 'is-invalid': errors.has('description') }">
                    </b-form-group>


                    <b-form-group
                            description="Optional"
                            label="Details"
                            label-for="details"
                            class="mb-4"
                    >
                        <textarea class="form-control" rows="3" v-model="form_data.details" id="details" name="details" ></textarea>
                    </b-form-group>

                    <b-form-group
                            label="Include as default to all itineraries?"
                            label-for="is_default_checked"
                            class="mb-0"
                    >
                        <label class="switch switch-pill switch-label switch-success">
                            <input type="checkbox" class="switch-input" id="is_default_checked" v-model="form_data.is_default_checked">
                            <span class="switch-slider" data-checked="YES" data-unchecked="NO"></span>
                        </label>
                    </b-form-group>
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
                    console.log(this.form_data);
                    if (data.value) {
                        this.$validator.validateAll().then(result=>{
                            if(result){
                                this.is_saving=true;
                                this.axios.post('maintenance/exclusions/save',this.form_data).then(response => {
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
