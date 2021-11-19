<template>
    <div>
        <div class="m-3 p-3 shadow">
            <div class="alert alert-info text-justify">
                IMPORTANT NOTE: All passport information required on your crew list is intended for the official document that all passenger-carrying vessels are required to submit to the maritime authorities by law. It is your responsibility to ensure the accuracy, validity and completeness of all information provided.  Under no circumstance shall the company and all its representatives have any liability to you or the authorities for any delays or loss of any kind incurred as a result of any inaccurate, invalid or incomplete information provided herein.
            </div>
            <b-row class="m-0">
                <b-col md="2" class="pl-0 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Salutation</strong>
                        <select class="form-control mt-1" v-model="guest_info.guest_details.guest_title_id"
                                :class="{ 'is-invalid': guest_info.guest_details.guest_title_id=='' }">
                            <option value="">Title</option>
                            <option v-for="guest_title in guest_titles" :value="guest_title.id">
                                {{guest_title.description}}
                            </option>
                        </select>
                    </div>
                </b-col>
                <b-col md="4" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">First Name</strong>
                        <input v-model="guest_info.guest_details.first_name" type="text" class="form-control mt-1"
                               placeholder="Given Name/ First Name"
                               :class="{ 'is-invalid': guest_info.guest_details.first_name=='' }">
                    </div>
                </b-col>
                <b-col md="6" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Last Name</strong>
                        <input v-model="guest_info.guest_details.last_name" type="text" class="form-control mt-1"
                               placeholder="Family Name/ Surname"
                               :class="{ 'is-invalid': guest_info.guest_details.last_name=='' }">
                    </div>
                </b-col>
            </b-row>
            <b-row class="m-0">
                <b-col md="6" class="p-1">
                    <div class="form-group">
                        <strong class="text-muted">Country Code</strong>
                        <select v-model="guest_info.guest_details.country_code_id" class="form-control mt-1">
                            <option value="">Select</option>
                            <optgroup label="Frequently used country codes">
                                <template v-for="cc in nationalities">
                                    <option :value="cc.id" v-if="cc.is_preferred==1">{{cc.description}} - ({{cc.country_code}})</option>
                                </template>
                            </optgroup>
                            <optgroup label="Other Country Codes">
                                <template v-for="cc in nationalities">
                                    <option :value="cc.id" v-if="cc.is_preferred==0">{{cc.description}} - ({{cc.country_code}})</option>
                                </template>
                            </optgroup>
                        </select>
                    </div>
                </b-col>
                <b-col md="6" class="p-1">
                    <div class="form-group">
                        <strong class="text-muted">Phone</strong>
                        <input v-model="guest_info.guest_details.phone_number" type="text" class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.phone_number=='' }">
                    </div>
                </b-col>
            </b-row>
            <b-row class="m-0">
                <b-col md="6" class="pl-0 pr-0">
                    <strong class="text-muted">Gender</strong>
                    <select v-model="guest_info.guest_details.gender_id" class="form-control mt-1"
                            :class="{ 'is-invalid': guest_info.guest_details.gender_id=='' }">
                        <option value="">Select Gender</option>
                        <option v-for="g in gender" :value="g.id">{{g.description}}</option>
                    </select>
                </b-col>
                <b-col md="6" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Email</strong>
                        <input v-model="guest_info.guest_details.email" type="email" class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.email=='' }">
                    </div>
                </b-col>
            </b-row>
            <b-row class="m-0">
                <b-col md="6" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Passport Number</strong>
                        <input v-model="guest_info.guest_details.passport_number" type="text" class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.passport_number=='' }">
                    </div>
                </b-col>
                <b-col md="6" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Exiration Date</strong>
                        <input v-model="guest_info.guest_details.expiration_date" type="email" class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.expiration_date=='' }">
                    </div>
                </b-col>
            </b-row>
            <b-row class="m-0">
                <b-col md="6" class="pl-0 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Nationality</strong>
                        <select v-model="guest_info.guest_details.nationality_id" class="form-control mt-1"
                                :class="{ 'is-invalid': guest_info.guest_details.nationality_id=='' }">
                            <option value="">Select Nationality</option>
                            <option v-for="nationality in nationalities" :value="nationality.id">
                                {{nationality.description}}
                            </option>
                        </select>
                    </div>
                </b-col>
                <b-col md="4" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Date of Birth</strong>
                        <input @change="getAge" v-model="guest_info.guest_details.birth_date.default" type="date"
                               class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.birth_date.default=='' }">
                    </div>
                </b-col>
                <b-col md="2" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Age</strong>
                        <input disabled="disabled" v-model="guest_info.guest_details.birth_date.other_formats.format_2"
                               type="text" class="form-control mt-1">
                    </div>
                </b-col>
            </b-row>
            <b-row class="m-0">
                <b-col md="6" class="pl-0 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Place of Birth</strong>
                        <input v-model="guest_info.guest_details.pob_country" placeholder="Country" type="text"
                               class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.pob_country=='' || guest_info.guest_details.pob_country==null }">
                    </div>
                </b-col>
                <b-col md="6" class="pl-2 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">&nbsp;</strong>
                        <input v-model="guest_info.guest_details.pob_city" placeholder="City" type="email"
                               class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.pob_city=='' || guest_info.guest_details.pob_city==null }">
                    </div>
                </b-col>
            </b-row>
            <b-row class="m-0">
                <b-col md="12" class="pl-0 pr-0">
                    <div class="form-group">
                        <strong class="text-muted">Current Residency</strong>
                        <input placeholder="(City, Country)" v-model="guest_info.guest_details.current_residency"
                               type="email" class="form-control mt-1"
                               :class="{ 'is-invalid': guest_info.guest_details.current_residency=='' || guest_info.guest_details.current_residency==null }">
                    </div>
                </b-col>
            </b-row>
            <b-row class="mt-2 mx-0 mb-0">
                <b-col class="px-0">
                    <strong class="text-muted">Medical Issues</strong>
                    <b-form-textarea
                            placeholder="..."
                            v-model="guest_info.guest_details.medical_issues"
                            :class="{ 'is-invalid': guest_info.guest_details.medical_issues=='' }"
                    ></b-form-textarea>
                </b-col>
            </b-row>
            <b-row class="mt-2 mx-0 mb-0">
                <b-col class="px-0">
                    <strong class="text-muted">Allergies</strong>
                    <b-form-textarea
                            placeholder="..."
                            v-model="guest_info.guest_details.allergies"
                            :class="{ 'is-invalid': guest_info.guest_details.allergies=='' }"
                    ></b-form-textarea>
                </b-col>
            </b-row>
            <b-row class="mt-2 mx-0 mb-0">
                <b-col class="px-0">
                    <strong class="text-muted">Diet</strong>
                    <select v-model="guest_info.guest_details.diet_option_id" class="form-control mt-1"
                            :class="{ 'is-invalid': guest_info.guest_details.diet_option_id=='' }">
                        <option value="">Select Diet</option>
                        <option v-for="diet in diet_options" :value="diet.id">{{diet.description}}</option>
                    </select>
                </b-col>
            </b-row>
            <b-row class="mt-2 mx-0 mb-0">
                <b-col class="px-0">
                    <strong class="text-muted">Other Concerns <small>(Any other things we need to know about you?)</small></strong>
                    <b-form-textarea
                            placeholder="..."
                            v-model="guest_info.guest_details.other_concerns"
                    ></b-form-textarea>
                </b-col>
            </b-row>
            <div class="text-right mt-2">
                <b-button size="sm" variant="success" @click="updateGuestDetails()"><i class='fa fa-fw fa-save'></i>Save
                </b-button>
            </div>
        </div>
    </div>
</template>

<script>
    import {bus} from '@/main.js'
    import SwalMixin from '@/views/mixins/Swal.js'

    export default {
        name: 'guest-details',
        inheritAttrs: false,
        mixins: [SwalMixin],
        props: {
            guest: {
                type: [Array, Object],
                default: () => []
            },
            guest_titles: {
                type: [Array, Object],
                default: () => []
            },
            nationalities: {
                type: [Array, Object],
                default: () => []
            },
            diet_options: {
                type: [Array, Object],
                default: () => []
            },
            gender: {
                type: [Array, Object],
                default: () => []
            }

        },
        data() {
            return {
                guest_info: {},
            }
        },
        methods: {
            getAge(data) {
                if (data.target.value == '') {
                    this.guest_info.guest_details.birth_date.other_formats.format_2 = 0;
                    return;
                }
                var today = new Date();
                var birthDate = new Date(data.target.value);
                var age = today.getFullYear() - birthDate.getFullYear();
                var m = today.getMonth() - birthDate.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }
                this.guest_info.guest_details.birth_date.other_formats.format_2 = age;
            },
            updateGuestDetails() {
                this.swalConfirmSubmit((data) => {
                    if (data.value) {
                        this.axios.post('bookings/save_guest_booking_details', this.guest_info).then(response => {
                            // this.invoice_payment_modal=false;
                            // this.amount_paid.value=0;
                            // this.getBookingDetails(this.booking_id);
                            this.swal_transaction_completed_data.text = "Guest details successfully updated.";
                            this.swalTransactionCompleted();
                            this.$emit('guest_details_saved');
                        }).catch(error => {
                            this.swalRequestError();
                            this.is_saving = false;
                        });
                    }
                });
            }
        },
        created() {
            this.guest_info = JSON.parse(JSON.stringify(this.guest));
            console.log(this.guest_info)
        }
    }
</script>
