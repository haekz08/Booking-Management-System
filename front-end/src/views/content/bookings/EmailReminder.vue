<template>
    <div>
        <!-- Modal Component -->
        <b-modal header-text-variant="light" header-bg-variant="primary" footer-bg-variant="primary" centered
                 v-model="open_modal" @close="closeModal" :size="modal_size" body-class="p-3" header-class="p-2" hide-footer
                 no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5 class="mb-0"><i class='fa fa-envelope'></i>&nbsp;&nbsp;Send Email<span></span></h5>
                </div>
            </template>
            <b-row align-v="center" class="modal-loader" v-if="is_saving">
                <b-col>
                    <b-spinner></b-spinner>
                    <br><br>
                    <strong>Loading</strong>
                </b-col>
            </b-row>
            <div>
                <b-form-group
                        :description="errors.has('email_to') ? '' : '*This field is required.'"
                        :invalid-feedback="!errors.has('email_to') ? '' : '*'+errors.first('email_to')"
                        :state="false"
                        label="To"
                        label-for="email_to"
                        class="mb-2"
                >
                    <input type="text" class="form-control" v-model="selected_email_reminder.email_to" v-validate="'required'" id="email_to" name="email_to" v-bind:class="{ 'is-invalid': errors.has('email_to') }">
                </b-form-group>
                <b-form-group
                        :description="errors.has('subject') ? '' : '*This field is required.'"
                        :invalid-feedback="!errors.has('subject') ? '' : '*'+errors.first('subject')"
                        :state="false"
                        label="Email Subject"
                        label-for="subject"
                        class="mb-2"
                >
                    <input type="text" class="form-control" v-model="selected_email_reminder.subject" v-validate="'required'" id="subject" name="subject" v-bind:class="{ 'is-invalid': errors.has('subject') }">
                </b-form-group>
                <b-form-group
                        :description="errors.has('content') ? '' : '*This field is required.'"
                        :invalid-feedback="!errors.has('content') ? '' : '*'+errors.first('content')"
                        :state="false"
                        label="Content"
                        label-for="content"
                        class="mb-2"
                >
                    <textarea class="form-control" rows="12" v-model="selected_email_reminder.content" v-validate="'required'" id="content" name="content"  v-bind:class="{ 'is-invalid': errors.has('subject') }"></textarea>
                </b-form-group>
                <div class="text-right p-0">
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
                        <i class="fa fa-send"></i> Send
                    </b-button>
                </div>
            </div>
        </b-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js'
    import SwalMixin from '@/views/mixins/Swal.js'

    export default {
        name: 'email-reminder-modal',
        inheritAttrs: false,
        mixins:[SwalMixin],
        props: {
            open_modal: {
                type: Boolean,
                default: true
            },
            booking_details: {
                type: [Array, Object],
                default: () => []
            },
            selected_email_reminder: {
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
            //this.form_data.email_to=this.booking_details.user.email;
            //this.form_data.booking_id=this.booking_details.id;
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
                                this.axios.post('send_email/'+this.selected_email_reminder.api,this.selected_email_reminder).then(response => {
                                    this.closeModal();
                                    this.swal_transaction_completed_data.title="Email Sent"
                                    this.swal_transaction_completed_data.text="Successfully sent to "+ this.selected_email_reminder.email_to;
                                    this.transactionCompleted();
                                    this.swalTransactionCompleted();
                                    this.is_saving=false;
                                    this.open_modal=false;
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
