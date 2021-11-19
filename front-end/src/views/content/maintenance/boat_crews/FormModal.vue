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
                    <b-row class="m-0">
                        <b-col md="4" class="pl-0 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Crew Type</strong>
                                <select class="form-control mt-1" v-model="form_data.crew_type_id" name="crew_type" v-validate="'required'" :class="{ 'is-invalid': errors.has('crew_type') }">
                                    <option value="">Crew Type</option>
                                    <option v-for="ct in crew_types" :value="ct.id">{{ct.description}}</option>
                                </select>
                            </div>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col md="2" class="pl-0 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Name</strong>
                                <select class="form-control mt-1" v-model="form_data.guest_title_id" name="guest_title" v-validate="'required'" :class="{ 'is-invalid': errors.has('guest_title') }">
                                    <option value="">Title</option>
                                    <option v-for="guest_title in guest_titles" :value="guest_title.id">{{guest_title.description}}</option>
                                </select>
                            </div>
                        </b-col>
                        <b-col md="4" class="pl-2 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">&nbsp;</strong>
                                <input  v-model="form_data.first_name" type="text" class="form-control mt-1" placeholder="Given Name/ First Name" name="first_name" v-validate="'required'" :class="{ 'is-invalid': errors.has('first_name') }">
                            </div>
                        </b-col>
                        <b-col md="6" class="pl-2 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">&nbsp;</strong>
                                <input  v-model="form_data.last_name" type="text" class="form-control mt-1" placeholder="Family Name/ Surname" name="last_name" v-validate="'required'" :class="{ 'is-invalid': errors.has('last_name') }">
                            </div>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col md="6" class="pl-0 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Phone</strong>
                                <input v-model="form_data.phone_number" type="text" class="form-control mt-1" name="phone_number" v-validate="'required'" :class="{ 'is-invalid': errors.has('phone_number') }">
                            </div>
                        </b-col>
                        <b-col md="6" class="pl-2 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Email</strong>
                                <input v-model="form_data.email" type="email" class="form-control mt-1" name="email" v-validate="'required'" :class="{ 'is-invalid': errors.has('email') }">
                            </div>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col md="6" class="pl-0 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Passport Number</strong>
                                <input v-model="form_data.passport_number" type="text" class="form-control mt-1" name="passport_number" v-validate="'required'"  :class="{ 'is-invalid': errors.has('passport_number') }">
                            </div>
                        </b-col>
                        <b-col md="6" class="pl-2 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Exiration Date</strong>
                                <input v-model="form_data.expiration_date" type="text" class="form-control mt-1" name="expiration_date" v-validate="'required'"  :class="{ 'is-invalid': errors.has('expiration_date') }">
                            </div>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col md="6" class="pl-0 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Nationality</strong>
                                <select v-model="form_data.nationality_id" class="form-control mt-1" name="nationality" v-validate="'required'" :class="{ 'is-invalid': errors.has('nationality') }">
                                    <option value="">Select Nationality</option>
                                    <option v-for="nationality in nationalities" :value="nationality.id">{{nationality.description}}</option>
                                </select>
                            </div>
                        </b-col>
                        <b-col md="4" class="pl-2 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Date of Birth</strong>
                                <input @change="getAge" v-model="form_data.birth_date.default" type="date" class="form-control mt-1" name="birth_date" v-validate="'required'" :class="{ 'is-invalid': errors.has('birth_date') }">
                            </div>
                        </b-col>
                        <b-col md="2" class="pl-2 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Age</strong>
                                <input disabled="disabled" v-model="form_data.birth_date.other_formats.format_2" type="text" class="form-control mt-1">
                            </div>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col md="6" class="pl-0 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Place of Birth</strong>
                                <input v-model="form_data.pob_country" placeholder="Country" type="text" class="form-control mt-1" name="pob_country" v-validate="'required'" :class="{ 'is-invalid': errors.has('pob_country') }">
                            </div>
                        </b-col>
                        <b-col md="6" class="pl-2 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">&nbsp;</strong>
                                <input v-model="form_data.pob_city" placeholder="City" type="text" class="form-control mt-1" name="pob_city" v-validate="'required'" :class="{ 'is-invalid': errors.has('pob_city') }">
                            </div>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col md="12" class="pl-0 pr-0">
                            <div class="form-group">
                                <strong class="text-muted">Current Residency</strong>
                                <input v-model="form_data.current_residency" type="text" class="form-control mt-1" name="current_residency" v-validate="'required'" :class="{ 'is-invalid': errors.has('current_residency') }">
                            </div>
                        </b-col>
                    </b-row>
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
                crew_types:[],
                guest_titles:[],
                nationalities:[]
            }
        },
        watch:{
            open_modal:{
                handler(val){
                    if(val.modal_status){
                        this.getGuestTitles();
                        this.getNationalities();
                        this.getCrewTypes();
                    }
                },
                deep:true,
                immediate:true
            }
        },
        methods: {
            getCrewTypes() {
                this.axios.get('maintenance/crew_types/get_all')
                    .then(
                        response => {
                            this.crew_types = response.data;
                        }
                    );
            },
            getAge(data){
                if(data.target.value == ''){
                    this.form_data.birth_date.other_formats.format_2 = 0;
                    return;
                }
                var today = new Date();
                var birthDate = new Date(data.target.value);
                var age = today.getFullYear() - birthDate.getFullYear();
                var m = today.getMonth() - birthDate.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }
                this.form_data.birth_date.other_formats.format_2 = age;

            },
            getGuestTitles(){
                this.axios.get('maintenance/guest_titles/get_all').then(
                    response => {
                        this.guest_titles = response.data;
                    }
                );
            },
            getNationalities(){
                this.axios.get('maintenance/nationalities/get_all').then(
                    response => {
                        this.nationalities = response.data;
                    }
                );
            },
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
                                this.axios.post('maintenance/boat_crews/save',this.form_data).then(response => {
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
