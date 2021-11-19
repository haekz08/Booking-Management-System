<template>
    <div class="container mt-5">
        <b-row v-if="itineraries.length==0 && !loading">
            <b-col class="text-center">
                <h3 class="text-muted">
                    NO ITINERARIES TO DISPLAY YET
                </h3>
                <router-link to="/booking">Go Back</router-link>
            </b-col>
        </b-row>
        <b-row v-else>
            <b-col lg="4" md="6" sm="12" v-for="itinerary in itineraries" class="mb-4">
                <b-row>
                    <b-col>
                        <b-carousel
                                :interval="4000"
                                controls
                                indicators
                                background="#ababab"
                                img-width="1024"
                                img-height="480"
                        >
                            <template v-if="itinerary.itinerary_media.length>0">
                                <b-carousel-slide v-for="(media, index) in itinerary.itinerary_media">
                                    <template v-slot:img>
                                        <img
                                                class="country-image-slider"
                                                :src="assets_path.MEDIA_UPLOADS + media.new_file_name"
                                        >
                                    </template>
                                </b-carousel-slide>
                            </template>
                            <b-carousel-slide v-else>
                                <template v-slot:img>
                                    <img
                                            class="country-image-slider"
                                            :src="assets_path.MEDSAILING_ASSETS + 'image-not-found.jpg'"
                                    >
                                </template>
                            </b-carousel-slide>
                        </b-carousel>
                    </b-col>
                </b-row>
                <b-row class="m-0 p-0">
                    <b-col class="bg-white p-2">
                        <!-- <h6 class="text-muted mb-0">Itinerary Date</h6> -->
                        <h6 class="card-title border-bottom pb-2">
                            <strong class="text-primary">
                                {{itinerary.itinerary_city_from.name}} to {{itinerary.itinerary_city_to.name}}
                                <b-badge variant="danger float-right blink"
                                         v-if="JSON.parse(itinerary.early_bird_validity)">Early Bird Promo
                                </b-badge>
                            </strong>
                            <span class="d-block text-muted mt-1 mb-0 h7">{{itinerary.check_in.other_formats.format_1}} -
                                {{itinerary.check_out.other_formats.format_1}} | 
                                <strong class="text-primary" v-if="itinerary.slot_left.default>0">{{itinerary.slot_left.default}} place/s left</strong>
                                <strong class="text-danger" v-else>FULLY BOOKED</strong>
                            </span>
                        </h6>
                        <div v-if="!JSON.parse(itinerary.early_bird_validity)">
                            <b-row>
                                <b-col class="text-center">
                                    <span class="mb-0 h7">Single Occupancy</span>
                                    <span class="d-block h7 mb-2"><strong>(Shared Cabin)</strong></span>
                                    <h5 class="mb-1">{{itinerary.lowest_price.price_per_person.other_formats.format_1}}</h5>
                                    <p class="text-muted font-weight-normal">Regular Price</p>
                                </b-col>
                                <b-col class="text-center">
                                    <span class="mb-0 h7">Single Occupancy</span>
                                    <span class="d-block h7 mb-2"><strong>(Private Cabin)</strong></span>
                                    <h5 class="mb-1">{{itinerary.lowest_price.cabin_price.other_formats.format_1}}</h5>

                                    <p class="text-muted font-weight-normal">Regular Price</p>
                                </b-col>
                            </b-row>
                        </div>

                        <div v-else>
                            <b-row>
                                <b-col class="text-center">
                                    <span class="mb-0 h7">Single Occupancy</span>
                                    <span class="d-block h7 mb-2"><strong>(Shared Cabin)</strong></span>
                                    <h5 class="text-danger mb-1">
                                        {{itinerary.lowest_price.early_bird_price.other_formats.format_1}}</h5>
                                    <p class="text-muted font-weight-normal text-line-through">
                                        {{itinerary.lowest_price.price_per_person.other_formats.format_1}}</p>
                                </b-col>
                                <b-col class="text-center">
                                    <span class="mb-0 h7">Single Occupancy</span>
                                    <span class="d-block h7 mb-2"><strong>(Private Cabin)</strong></span>
                                    <h5 class="text-danger mb-1">
                                        {{itinerary.lowest_price.cabin_early_bird_price.other_formats.format_1}}</h5>
                                    <p class="text-muted font-weight-normal text-line-through">
                                        {{itinerary.lowest_price.cabin_price.other_formats.format_1}}</p>
                                </b-col>
                            </b-row>
                            <!-- Price per Person : {{itinerary.lowest_price.early_bird_price.other_formats.format_1}}<br>
                            Cabin Price : {{itinerary.lowest_price.cabin_early_bird_price.other_formats.format_1}}<br> -->
                        </div>

                        <!-- <div>
                        Availability: <strong>{{itinerary.slot_left.default}}</strong> slot/s left<br>
                        </div> -->
                        <b-row>
                            <b-col>
                                <div class="d-flex align-items-center" v-if="itinerary.ambassador_id!=-1">
                                    <!--<a :href="itinerary.ambassador.instructor_profile" target="_blank">-->
                                    <img
                                            v-if="itinerary.ambassador.ambassador_media.length!=0"
                                            :src="assets_path.MEDIA_UPLOADS + itinerary.ambassador.ambassador_media[0].new_file_name"
                                            class="img-avatar ambassador-avatar"/>
                                    <img
                                            v-else
                                            :src="assets_path.MEDSAILING_ASSETS + 'image-not-found.jpg'"
                                            class="img-avatar ambassador-avatar"/>
                                    <div class="small ambassador-label ml-2">
                                        <span>Ambassador</span>
                                        <h6 class="d-block m-0 text-primary">
                                            <a :href="itinerary.ambassador.instructor_profile" target="_blank" class="cursor-pointer">
                                                {{itinerary.ambassador.full_name}}
                                            </a>
                                        </h6>
                                    </div>

                                    <!--</a>-->
                                </div>
                                <!--<div class="d-flex align-items-center" v-else>-->
                                    <!--<img-->
                                            <!--:src="assets_path.MEDSAILING_ASSETS + 'image-not-found.jpg'"-->
                                            <!--class="img-avatar ambassador-avatar img-thumbnail"/>-->
                                    <!--<strong class="d-block text-muted mb-0 ml-2">-->
                                        <!--TBA-->
                                    <!--</strong>-->
                                <!--</div>-->
                            </b-col>
                        </b-row>
                        <b-row class="m-0 mt-3">
                            <b-col class="bg-info p-2 book-btn cursor-pointer" @click="inquireItinerary(itinerary)">
                                <!--<h6 class="w-100 text-center mb-0 text-uppercase">Book <br> Private Charter</h6>-->
                                <h6 class="w-100 text-center mb-0 text-uppercase">Inquire <br>  Now</h6>
                            </b-col>
                            <b-col class="bg-primary p-2 book-btn cursor-pointer" @click="bookItinerary(itinerary)" v-if="itinerary.slot_left.default>0">
                                <h6 class="w-100 text-center mb-0 text-uppercase">Book <br> Cabin Charter</h6>
                            </b-col>
                            <b-col class="bg-danger p-2" v-else>
                                <h6 class="w-100 text-center mb-0 text-uppercase">FULLY <br> BOOKED</h6>
                            </b-col>
                        </b-row>

                    </b-col>
                </b-row>
            </b-col>
        </b-row>
        <!-- Modal Component -->
        <b-modal
                v-if="Object.keys(inquire_modal_event).length > 0"
                header-bg-variant="primary" footer-bg-variant="primary" centered
                v-model="inquire_modal" body-class="p-0"
                no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5 class="mb-0"><i class='fa fa-ship'></i>&nbsp;&nbsp;INQUIRE NOW<span></span></h5>
                </div>
            </template>
            <div class="custom-modal-body">
                <b-form id="inquiry_form" @submit.prevent="SubmitInquiryForm">
                    <h5 class="card-title border-bottom pb-2 text-center">
                        <strong class="text-primary">{{inquire_modal_event.itinerary_city_from.name}} to
                            {{inquire_modal_event.itinerary_city_to.name}}</strong>
                        <h6 class="d-block text-muted mt-2 mb-0">{{inquire_modal_event.check_in.other_formats.format_1}}
                            -
                            {{inquire_modal_event.check_out.other_formats.format_1}} </h6>
                    </h5>
                    <b-row>
                        <b-col md="10" offset-md="1">
                            <b-form-group
                                    :description="errors.has('full_name') ? '' : '*This field is required.'"
                                    :invalid-feedback="!errors.has('full_name') ? '' : '*'+errors.first('full_name').replace(/_/g, ' ')"
                                    :state="false"
                                    label="Full Name"
                                    label-for="full_name"
                                    class="mb-0 font-weight-bold"
                            >
                                <input :readonly="inquire_request_status" type="text" class="form-control" v-model="inquire_now_inputs.full_name"
                                       v-validate="'required'" id="full_name" name="full_name"
                                       v-bind:class="{ 'is-invalid': errors.has('full_name') }">
                            </b-form-group>
                        </b-col>
                    </b-row>

                    <b-row class="mt-2">
                        <b-col md="10" offset-md="1">
                            <b-form-group
                                    :description="errors.has('email') ? '' : '*This field is required.'"
                                    :invalid-feedback="!errors.has('email') ? '' : '*'+errors.first('email')"
                                    :state="false"
                                    label="Email"
                                    label-for="email"
                                    class="mb-0 font-weight-bold"
                            >
                                <input :readonly="inquire_request_status" type="text" class="form-control" v-model="inquire_now_inputs.email"
                                       v-validate="'required|email'" id="email" name="email"
                                       v-bind:class="{ 'is-invalid': errors.has('email') }">
                            </b-form-group>
                        </b-col>
                    </b-row>

                    <b-row class="mt-2">
                        <b-col md="10" offset-md="1">
                            <b-form-group
                                    :description="errors.has('subject') ? '' : '*This field is required.'"
                                    :invalid-feedback="!errors.has('subject') ? '' : '*'+errors.first('subject')"
                                    :state="false"
                                    label="Subject"
                                    label-for="subject"
                                    class="mb-0 font-weight-bold"
                            >
                                <input :readonly="inquire_request_status" type="text" class="form-control" v-model="inquire_now_inputs.subject"
                                       v-validate="'required'" id="subject" name="subject"
                                       v-bind:class="{ 'is-invalid': errors.has('subject') }">
                            </b-form-group>
                        </b-col>
                    </b-row>

                    <b-row class="mt-2">
                        <b-col md="10" offset-md="1">
                            <b-form-group
                                    :description="errors.has('message') ? '' : '*This field is required.'"
                                    :invalid-feedback="!errors.has('message') ? '' : '*'+errors.first('message')"
                                    :state="false"
                                    label="Message"
                                    label-for="message"
                                    class="mb-0 font-weight-bold"
                            >
                                <textarea :readonly="inquire_request_status" class="form-control" v-model="inquire_now_inputs.message"
                                          v-validate="'required'" id="message" name="message"
                                          v-bind:class="{ 'is-invalid': errors.has('message') }" cols="30"
                                          rows="4"></textarea>
                            </b-form-group>
                        </b-col>
                    </b-row>

                </b-form>
            </div>
            <div slot="modal-footer">
                <b-button variant="secondary" style="margin-right: .25rem;" @click="CloseInquiryForm">Close
                </b-button>
                <b-button type="submit" form="inquiry_form" variant="primary"
                          style="border-color: #1985ac; background-color: #1b8eb7;">
                    <span v-if="!inquire_request_status">Submit</span>
                    <span v-else><i class="fa fa-pulse fa-spinner"></i> Submitting</span>
                </b-button>
            </div>
        </b-modal>

        <b-modal header-bg-variant="primary" footer-bg-variant="primary" centered
                 v-model="book_modal" size="xl" body-class="p-0"
                 no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5 class="mb-0"><i class='fa fa-ship'></i>&nbsp;&nbsp;BOOK NOW<span></span></h5>
                </div>
            </template>
            <div v-if="book_modal">
                <b-row class="m-0">
                    <b-col lg="5" md="12" sm="12">

                        <div class="text-center p-2">
                            <img
                                    :src="assets_path.MEDSAILING_ASSETS + '/logo.png'"
                                    class="w-50"/>
                        </div>
                        <b-card no-body>
                            <b-tabs pills card>
                                <b-tab title="Trip Images" active>
                                    <b-card-text>
                                        <b-carousel
                                                :interval="4000"
                                                controls
                                                indicators
                                                background="#ababab"
                                        >
                                            <b-carousel-slide
                                                    v-for="(media, index) in form_data.itinerary.itinerary_media">
                                                <template v-slot:img>
                                                    <img
                                                            class="image-slider-book"
                                                            :src="assets_path.MEDIA_UPLOADS + media.new_file_name"
                                                    >
                                                </template>
                                            </b-carousel-slide>
                                        </b-carousel>
                                    </b-card-text>
                                </b-tab>
                                <b-tab title="Boat Images">
                                    <b-card-text>
                                        <b-carousel
                                                :interval="4000"
                                                controls
                                                indicators
                                                background="#ababab"
                                        >
                                            <b-carousel-slide
                                                    v-for="(media, index) in form_data.itinerary.itinerary_boat.boat_media">
                                                <template v-slot:img>
                                                    <img
                                                            class="image-slider-book"
                                                            :src="assets_path.MEDIA_UPLOADS + media.new_file_name"
                                                    >
                                                </template>
                                            </b-carousel-slide>
                                        </b-carousel>
                                    </b-card-text>
                                </b-tab>
                            </b-tabs>
                        </b-card>

                    </b-col>
                    <b-col class="p-2">
                        <b-row>
                            <b-col>
                                <div>
                                    <h3 class="text-primary text-center mb-0 mt-0">
                                        <strong>{{form_data.itinerary.itinerary_brand.description}}</strong>
                                    </h3>
                                    <h5 class="text-center mb-1">
                                        <strong>{{form_data.itinerary.itinerary_city_from.name}} to
                                            {{form_data.itinerary.itinerary_city_to.name}}</strong>
                                    </h5>
                                    <h6 class="text-center">
                                        <strong>{{form_data.itinerary.check_in.other_formats.format_1}} -
                                            {{form_data.itinerary.check_out.other_formats.format_1}}</strong>
                                        |
                                        <strong class="text-primary">{{form_data.itinerary.slot_left.default}} place/s left</strong>
                                    </h6>
                                </div>
                            </b-col>
                        </b-row>
                        <template v-if="!loggedIn">
                        <b-row class="m-0">
                            <b-col md="3" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">Salutation</span>
                                    <select class="form-control mt-1" v-model="form_data.guest_title_id.value"
                                            v-bind:class="{ 'is-invalid': form_data.guest_title_id.error }">
                                        <option value="">Select</option>
                                        <option v-for="guest_title in form_data.guest_titles" :value="guest_title.id">
                                            {{guest_title.description}}
                                        </option>
                                    </select>
                                </div>
                            </b-col>
                            <b-col md="4" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">First Name</span>
                                    <input v-model="form_data.first_name.value" type="text" class="form-control mt-1"
                                           v-bind:class="{ 'is-invalid': form_data.first_name.error }">
                                </div>
                            </b-col>
                            <b-col md="5" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">Last Name</span>
                                    <input v-model="form_data.last_name.value" type="text" class="form-control mt-1"
                                           v-bind:class="{ 'is-invalid': form_data.last_name.error }">
                                </div>
                            </b-col>
                        </b-row>
                        <b-row class="m-0">
                            <b-col md="5" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">Country Code</span>
                                    <select v-model="form_data.country_code.value" class="form-control mt-1">
                                        <option value="">Select</option>
                                        <optgroup label="Frequently used country codes">
                                            <template v-for="cc in form_data.nationalities">
                                                <option :value="cc.id" v-if="cc.is_preferred==1">{{cc.description}} - ({{cc.country_code}})</option>
                                            </template>
                                        </optgroup>
                                        <optgroup label="Other Country Codes">
                                            <template v-for="cc in form_data.nationalities">
                                                <option :value="cc.id" v-if="cc.is_preferred==0">{{cc.description}} - ({{cc.country_code}})</option>
                                            </template>
                                        </optgroup>
                                    </select>
                                </div>
                            </b-col>
                            <b-col md="7" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">Phone Number</span>
                                    <input v-model="form_data.phone_number.value" type="text" class="form-control mt-1"
                                           v-bind:class="{ 'is-invalid': form_data.phone_number.error }">
                                </div>
                            </b-col>

                        </b-row>
                        </template>
                        <template v-else>
                            <hr>
                        </template>
                        <b-row class="m-0">
                            <b-col md="5" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">Number of Guest</span>
                                    <input type="text"
                                           v-model="form_data.number_of_guest.value" class="form-control mt-1"
                                           v-bind:class="{ 'is-invalid': form_data.number_of_guest.error }">
                                </div>
                            </b-col>
                            <b-col md="7" class="p-1">
                                <div class="form-group" v-if="!loggedIn">
                                    <span class="text-muted">Email</span><span class="float-right">I already have an account | <a @click.prevent="login_modal=true" href="">Login</a></span>
                                    <input v-model="form_data.email.value" type="text" class="form-control mt-1"
                                    v-bind:class="{ 'is-invalid': form_data.email.error }">
                                </div>
                                <div class="form-group" v-else>
                                    <span class="text-muted">You are logged in as</span><a class="float-right" @click.prevent="notMyAccountClicked" href="#">Not your account?</a>

                                    <input :value="userDetails.email" type="text" class="form-control mt-1" disabled>
                                </div>
                            </b-col>
                        </b-row>
                        <b-row class="m-0">
                            <b-col md="5" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">Promo Code</span>
                                    <input v-model="form_data.promo_code.value" type="text" class="form-control mt-1"
                                           v-bind:class="{ 'is-invalid': form_data.promo_code.error }">
                                </div>
                            </b-col>
                            <b-col md="7" class="p-1">
                                <div class="form-group">
                                    <span class="text-muted">How did you hear about us?</span>
                                    <select class="form-control mt-1" v-model="form_data.lead_source_id.value" v-bind:class="{ 'is-invalid': form_data.guest_title_id.error }">
                                        <option value="">Select</option>
                                        <option v-for="lead_source in form_data.lead_sources" :value="lead_source.id">
                                            {{lead_source.description}}
                                        </option>
                                    </select>
                                </div>
                            </b-col>
                        </b-row>
                        <div class="alert m-1"
                             v-bind:class="{ 'alert-danger': form_data.terms.error, 'alert-primary': !form_data.terms.error }"
                             role="alert">
                            <b-form-checkbox
                                    id="checkbox-1"
                                    v-model="form_data.terms.value"
                                    name="checkbox-1"
                                    :value=true
                                    :unchecked-value=false
                            >
                                I give consent for <strong>Med Sailing Holidays</strong> to contact me regarding my
                                sailing holiday
                            </b-form-checkbox>
                        </div>
                        <div class="text-center m-1 mt-3">
                            <b-button
                                    variant="success"
                                    class="btn-block"
                                    size="sm"
                                    @click="proceedToBooking"
                            >
                                <h5 class="m-0"><i class="fa fa-check-circle text-white"></i> PROCEED TO BOOKING</h5>
                            </b-button>
                        </div>
                    </b-col>

                </b-row>

            </div>
            <div slot="modal-footer" class="w-100 text-center">
                &copy; Copyright 2020 Med Sailing Holidays CY Ltd
            </div>
        </b-modal>

        <!-- Login Modal Component -->
        <b-modal
                header-bg-variant="primary" footer-bg-variant="primary" centered
                :hide-footer="true"
                v-model="login_modal" body-class="p-0"
                no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5 class="mb-0"><i class='fa fa-user'></i>&nbsp;&nbsp;Sign In to your account.<span></span></h5>
                </div>
            </template>
            <div class="custom-modal-body">
                <log-in-form />
            </div>
        </b-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js';
    import {assets_path} from '@/config';
    import SwalMixin from '@/views/mixins/Swal.js';
    import LogInForm from './LogInForm.vue';
    export default {
        name: 'BrandItineraries',
        mixins:[SwalMixin],
        components:{
            LogInForm
        },
        data() {
            return {
                loading: false,
                itineraries: [],
                country_slug: '',
                brand_slug: '',
                inquire_modal: false,
                inquire_request_status:false,
                inquire_modal_event: {},
                inquire_now_inputs: {
                    full_name: '',
                    email: '',
                    subject: '',
                    message: ''
                },
                book_modal: false,
                form_data: {
                    guest_title_id: {
                        value: '',
                        error: false
                    },
                    first_name: {
                        value: '',
                        error: false
                    },
                    last_name: {
                        value: '',
                        error: false
                    },
                    country_code: {
                        value: '',
                        error: false
                    },
                    phone_number: {
                        value: '',
                        error: false
                    },
                    email: {
                        value: '',
                        error: false
                    },
                    number_of_guest: {
                        value: 1,
                        error: false
                    },
                    promo_code: {
                        value: '',
                        error: false,
                        discount_amount: 0
                    },
                    lead_source_id:{
                        value: '',
                        error: false
                    },
                    terms: {
                        value: false,
                        error: false
                    },
                    has_promo_code: false,
                    itinerary: {},
                    guest_titles: [],
                    nationalities: [],
                    lead_sources:[],
                },
                login_modal:false
            }
        },
        computed: {
            loggedIn(){
                return this.$store.getters.loggedInAsGuest
            },
            userDetails(){
            return this.$store.getters.userDetails
            }
        },
        created() {
            this.assets_path = assets_path;
            this.country_slug = this.$route.params.country_slug;
            this.brand_slug = this.$route.params.brand_slug;
            this.getAllitineraries();
            bus.$on('logInModalClose', ()=>{
                this.login_modal=false;
            });
        },
        methods: {
            CloseInquiryForm() {
                this.inquire_modal = false;
                this.inquire_modal_event = {};
            },
            SubmitInquiryForm() {
                this.$validator.validateAll().then((result) => {
                    if (result) {
                        this.inquire_request_status = true;
                        this.axios.post('/send_email/inquiry',{
                            inquiry : this.inquire_now_inputs,
                            itinerary : this.inquire_modal_event
                        }).then(
                            response => {

                                this.inquire_modal = false;
                                this.inquire_request_status = false;
                                this.inquire_now_inputs = {
                                    full_name: '',
                                    email: '',
                                    subject: '',
                                    message: ''
                                }
                                this.$validator.reset();
                                this.swal_transaction_completed_data.text="Inquiry successfully sent!";
                                this.swalTransactionCompleted();
                            }
                        );
                    }
                });
            },
            inquireItinerary(itinerary) {
                this.inquire_modal_event = itinerary;
                this.inquire_modal = true;
            },
            getAllitineraries() {
                this.loading = true;
                this.axios.get('booking/itineraries', {
                    params: {
                        country_slug: this.country_slug,
                        brand_slug: this.brand_slug
                    }
                }).then(response => {
                    // this.list = (response.data.data) ? response.data.data : response.data;
                    // let result=response.data;
                    // this.brand_list=result;
                    this.itineraries = response.data.itineraries;
                    this.form_data.guest_titles = response.data.guest_titles;
                    this.form_data.nationalities = response.data.nationalities;
                    this.form_data.lead_sources = response.data.lead_sources;
                    this.loading = false;

                }).catch(error => console.log(error));
            },
            bookItinerary(itinerary) {
                this.book_modal = true;
                
                //this.form_data.number_of_guest_to_select=this.form_data.number_of_guest;
                this.form_data.itinerary = itinerary;
            },
            proceedToBooking() {
                //validate inputs
                let error = 0;
                if(!this.loggedIn)
                {
                    this.validateRequired(this.form_data.country_code) ? error++ : '';
                    this.validateRequired(this.form_data.guest_title_id) ? error++ : '';
                    this.validateRequired(this.form_data.first_name) ? error++ : '';
                    this.validateRequired(this.form_data.last_name) ? error++ : '';
                    this.validateRequired(this.form_data.phone_number) ? error++ : '';
                    this.validateRequired(this.form_data.email) ? error++ : '';
                }
                this.validateRequired(this.form_data.number_of_guest) ? error++ : '';
                this.validateRequired(this.form_data.lead_source_id) ? error++ : '';

                if (this.form_data.number_of_guest.value > this.form_data.itinerary.slot_left.default) {
                    error++;
                    this.form_data.number_of_guest.error = true;
                    this.swal_transaction_error_data.text="The number of guest submitted exceeds the available places left.";
                    this.swalRequestError();
                }
                if (this.form_data.number_of_guest.value <= 0 || isNaN(this.form_data.number_of_guest.value)) {
                    error++;
                    this.form_data.number_of_guest.error = true;
                    this.swal_transaction_error_data.text="The number of guest submitted is invalid.";
                    this.swalRequestError();
                }
                if (this.form_data.terms.value == false) {
                    this.form_data.terms.error = true;
                    error++;
                } else {
                    this.form_data.terms.error = false;
                }

                if(this.validateAmbassadorCodes())
                erorr++;

                if (error == 0) {
                    this.setUpItinerary();
                    //console.log(this.form_data.number_of_guest.value);
                    this.$router.push({name: 'Book', params: this.form_data});
                }
            },
            validateRequired(data) {
                if (data.value == '') {
                    data.error = true;
                    return true;
                } else {
                    data.error = false;
                    return false;
                }
            },
            setUpItinerary(){
                let user_selection={
                    occupancy:0,
                    price:0,
                    cabin_type:-1
                }
                this.form_data.itinerary.itinerary_cabins_for_booking.forEach((data,index) => {
                    let price_pp=data.price_per_person;
                    let price_cbn=data.cabin_price;
                    if(this.form_data.has_promo_code){
                        price_pp-=this.form_data.promo_code.discount_amount;
                        price_cbn-=this.form_data.promo_code.discount_amount;
                    }else{
                        price_pp=data.price_pp;
                        price_cbn=data.price_cbn;
                    }
                    let cabin_type_options=[
                        {
                            description:'Single Occupancy (Shared Cabin)',
                            text:'Shared cabin is where a solo traveler will share the whole cabin (double share) with another solo traveler that made a separate booking.',
                            price:price_pp,
                            original_price:data.price_per_person,
                            discount:data.price_per_person-price_pp,
                            cabin_type:1,
                            occupancy:1,
                            is_selected:false,
                            min_guest_remaining:1,
                            slot_to_deduct:1,
                            icon_class:'fa fa-fw fa-check-circle h5 text-success m-0'
                        },
                        {
                            description:'Single Occupancy (Private Cabin)',
                            text:'Single Occupancy is where a solo traveler decides to book the whole cabin privately and will not be sharing the cabin with anyone else.',
                            price:price_cbn,
                            original_price:data.cabin_price,
                            discount:data.cabin_price-price_cbn,
                            cabin_type:2,
                            occupancy:2,
                            is_selected:false,
                            min_guest_remaining:1,
                            slot_to_deduct:1,
                            icon_class:'fa fa-fw fa-check-circle h5 text-success m-0'
                        },
                        {
                            description:'Double Occupancy - 2 pax',
                            text:'Double Occupancy is where the cabin is occupied by two travelers that traveled and booked together.',
                            price:price_pp*2,
                            original_price:data.price_per_person*2,
                            discount:(data.price_per_person*2)-(price_pp*2),
                            cabin_type:3,
                            occupancy:2,
                            is_selected:false,
                            min_guest_remaining:2,
                            slot_to_deduct:2,
                            icon_class:'fa fa-fw fa-check-circle h5 text-success m-0'
                        }
                    ];
                    data.user_selection=user_selection;
                    data.cabin_type_options=cabin_type_options;
                });
                this.form_data.itinerary = JSON.parse(JSON.stringify(this.form_data.itinerary));
            },
            validateAmbassadorCodes(){
                if (JSON.parse(this.form_data.itinerary.is_locked_to_ambassador)) {
                    if (this.validateRequired(this.form_data.promo_code)) {
                        return true;
                    } else {
                        let accepted_codes = this.form_data.itinerary.ambassador_itinerary_codes.filter(x => x.ambassador_id == this.form_data.itinerary.ambassador_id && x.code == this.form_data.promo_code.value);
                        if (accepted_codes.length == 0) {
                            this.form_data.promo_code.error = true;
                            return true;
                        } else {
                            this.form_data.has_promo_code = true;
                            this.form_data.promo_code.discount_amount = accepted_codes[0].discount_amount;
                        }
                    }
                } else {
                    if (this.form_data.promo_code.value != '') {
                        let accepted_codes = this.form_data.itinerary.ambassador_itinerary_codes.filter(x => x.code == this.form_data.promo_code.value);
                        if (accepted_codes.length == 0) {
                            this.form_data.promo_code.error = true;
                            return true;
                        } else {
                            this.form_data.has_promo_code = true;
                            this.form_data.promo_code.discount_amount = accepted_codes[0].discount_amount;
                        }
                    }
                }
            },
            notMyAccountClicked(){
                this.$store.dispatch('logOutAction')
                .then(response => {
                    this.login_modal=true;
                })
                
            }
        }
    }
</script>
