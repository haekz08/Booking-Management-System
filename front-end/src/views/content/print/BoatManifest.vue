<template>
    <div>
        <template v-if="!fetching">
        <b-row class="m-0 align-items-end">
            <b-col class="p-0">
                <!-- <img :src="logo" class="medsailing-logo-print" alt="Medsailing Logo"> -->
                <img class="medsailing-logo-print" src="../../../../public/img/medsailing-logo.png" alt="Medsailing Logo">
            </b-col>
            <b-col sm="6" class="text-center">
                <h6 class="mb-0">MED SAILING HOLIDAYS CY LTD</h6>
                <p class="mb-0">Karantoki Building, 5th floor, Flat/Office 13 Nicosia, Larnaka 1065 Cyprus</p>
                <p class="mb-0">
                    Contact Number : +44 20 3289 9366
                </p>
            </b-col>
            <b-col class="p-0 text-right">
                <!-- <h6 class="mb-0 text-muted">Invoice Number</h6> -->
                <!-- <h2><strong>{{booking_details.active_invoice.invoice_number}}</strong></h2> -->
            </b-col>
        </b-row>
        <b-row class="m-0">
            <b-col class="p-0">
                <b-row class="bg-primary border border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            TRIP DETAILS
                        </strong>
                    </b-col>
                </b-row>
                <div class="border border-secondary border-top-0 bg-white p-2">
                    <b-row class="m-0">
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Itinerary Brand</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{itinerary_details.itinerary_brand.description}}
                                <span class="text-muted d-block h6">{{itinerary_details.itinerary_country.name}}</span>
                            </h3>
                        </b-col>
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Boat Model</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{itinerary_details.itinerary_boat.boat_brand.name}}
                                <span class="text-muted d-block h6">{{itinerary_details.itinerary_boat.boat_type.name}}</span>
                            </h3>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Check In</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{itinerary_details.itinerary_city_from.name}}
                                <span class="text-muted d-block h6">{{itinerary_details.port_from.name}}</span>
                            <span class="d-block h6">{{itinerary_details.check_in.other_formats.format_2}}</span>
                            </h3>
                        </b-col>
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Check Out</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{itinerary_details.itinerary_city_to.name}}
                                <span class="text-muted d-block h6">{{itinerary_details.port_to.name}}</span>
                            <span class="d-block h6">{{itinerary_details.check_out.other_formats.format_2}}</span>
                            </h3>
                        </b-col>
                    </b-row>
                </div>
            </b-col>
        </b-row>
        <table class="table table-bordered">
            <tbody>
                <tr v-for="(crew, index) in itinerary_details.itinerary_crews">
                    <td>
                        <strong>{{crew.full_name}}</strong> ({{crew.crew_type.description}})
                    </td>
                    <td>
                        <a class="cursor-pointer text-uppercase text-primary"
                            @click="update_crew_modal=true">
                            Update
                        </a>
                    </td>
                </tr>
                <tr v-if="itinerary_details.ambassador_id!=-1">
                    <td>
                        <strong>{{itinerary_details.itinerary_ambassador.full_name}}</strong> (Yoga Instructor/ Ambassador)
                        <div class="small text-muted">
                            Contact Number: {{(itinerary_details.itinerary_ambassador.phone_number!='') ? itinerary_details.itinerary_ambassador.phone_number : 'none'}}
                        </div>
                    </td>
                    <td>
                        <a class="cursor-pointer text-uppercase text-primary"
                            @click="update_crew_modal=true">
                            Update
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
        <b-row class="bg-primary border border-secondary m-0">
            <b-col class="p-2">
                <strong>
                    GUEST DETAILS
                </strong>
            </b-col>
        </b-row>
        <b-row class="bg-white m-0">
            <b-col class="p-0">
                <table class="table table-bordered">
                     <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Add Ons</th>
                            <th scope="col">Medical Issues</th>
                            <th scope="col">Allergies</th>
                            <th scope="col">Diet Option</th>
                            <th scope="col">Other Concerns</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <template v-for="(booking, booking_index) in itinerary_details.itinerary_bookings">
                            <tr v-for="(guest, index) in booking.guests">
                                <td>
                                    <div><strong>{{(guest.guest_details.full_name!=' ') ? guest.guest_details.full_name : 'Guest'}}</strong></div>
                                    <div class="small text-muted">
                                        <span>
                                        <template>Phone #: {{(guest.guest_details.country_code_id!='') ? guest.guest_details.country_code.country_code : ''}} {{guest.guest_details.phone_number=='' ? 'none':guest.guest_details.phone_number}}</template>
                                        </span> | Age: {{guest.guest_details.birth_date.other_formats.format_2==0 ? 'none':guest.guest_details.birth_date.other_formats.format_2}}
                                    </div>
                                    <div class="small text-muted">Cabin: <strong>{{guest.guest_cabin_details.cabin_description.cabin_type.name}} - {{guest.guest_cabin_details.cabin_description.code}}</strong></div>
                                </td>
                                <td>
                                    {{(guest.guest_details.gender_id!='') ? guest.guest_details.gender.description : ''}}
                                </td>
                                <td v-if="index==0 && booking.add_ons.length>=1">
                                    <span v-for="add_on in booking.add_ons"> {{add_on.qty}} {{add_on.details.description}}</span>
                                </td>
                                <td v-else>
                                    none
                                </td>
                                <td>{{guest.guest_details.medical_issues=='' ? 'none':guest.guest_details.medical_issues}}</td>
                                <td>{{guest.guest_details.allergies=='' ? 'none':guest.guest_details.allergies}}</td>
                                <td>{{guest.guest_details.diet_option_id=='' ? 'none':guest.guest_details.diet_option.description}}</td>
                                <td>{{guest.guest_details.other_concerns=='' ? 'none':guest.guest_details.other_concerns}}</td>
                                <td>
                                    <a class="cursor-pointer text-uppercase text-primary"
                                        @click="updateGuest(guest)">
                                        Update
                                    </a>
                                </td>
                            </tr>
                        </template>
                    </tbody>
                </table>
            </b-col>
        </b-row>
        <!-- UPDATE GUEST MODAL -->
        <b-modal header-text-variant="light"
                    header-bg-variant="primary"
                    v-model="update_guest_modal"
                    body-class="p-0"
                    size="lg"
                    no-close-on-backdrop no-close-on-esc
                    centered
                    hide-footer>
            <template slot="modal-title">
            <h6 class="m-0"><i class='fa fa-fw fa-user'></i>Update Guest Details <u></u></h6>
            </template>
            <guest-details
            :guest="selected_guest"
            :guest_titles="other_data.guest_titles"
            :nationalities="other_data.nationalities"
            :diet_options="other_data.diet_options"
            :gender="other_data.gender"
            @guest_details_saved="guestDetailsSaved"
            />
        </b-modal>
        <!-- END UPDATE GUEST MODAL -->

        <!-- UPDATE CREW MODAL -->
        <b-modal header-text-variant="light"
                    header-bg-variant="primary"
                    v-model="update_crew_modal"
                    body-class="p-0"
                    size="lg"
                    no-close-on-backdrop no-close-on-esc
                    centered
                    hide-footer>
            <template slot="modal-title">
            <h6 class="m-0"><i class='fa fa-fw fa-user'></i>Update Boat Crew <u></u></h6>
            </template>
            <crew-details
            :itinerary="itinerary_details"
            :other_data="other_data"
            @crew_details_saved="crewDetailsSaved"
            />
        </b-modal>
        <!-- END UPDATE CREW MODAL -->
        </template>
    </div>
</template>

<script>
    import GuestDetails from '@/views/helpers/GuestDetails.vue';
    import CrewDetails from '@/views/helpers/CrewDetails.vue';
    export default {
        name: "BoatManifest",
        components: {
            GuestDetails,
            CrewDetails
        },
        data(){
            return {
                itinerary_details:{},
                fetching:true,
                update_guest_modal: false,
                update_crew_modal:false,
                selected_guest: {},
                other_data:{
                    guest_titles: [],
                    nationalities: [],
                    diet_options: [],
                    gender: [],
                    boat_crews: [],
                }
            }
        },
        created(){
            this.getItineraryDetails(this.$route.params.itinerary_id);
        },
        mounted(){

        },
        methods:{
            getItineraryDetails(itinerary_id){
                this.axios.get('itinerary/get_boat_manifest',{params:{itinerary_id:itinerary_id}}).then(response => {
                    this.$nextTick(()=>{
                        this.itinerary_details=response.data.itinerary;
                        this.other_data.guest_titles = response.data.guest_titles;
                        this.other_data.nationalities = response.data.nationalities;
                        this.other_data.diet_options = response.data.diet_options;
                        this.other_data.gender = response.data.gender;
                        this.other_data.crew_types = response.data.crew_types;
                        this.other_data.ambassadors = response.data.ambassadors;
                        this.$nextTick(()=>{
                            this.$emit('print');
                            this.fetching=false
                        });
                    });
                }).catch(error => console.log(error));
            },
            updateGuest(guest) {
                this.update_guest_modal = true;
                this.selected_guest = guest;
            },
            guestDetailsSaved() {
                this.update_guest_modal = false;
                this.getItineraryDetails(this.itinerary_details.id);
            },
            crewDetailsSaved() {
                this.update_crew_modal = false;
                this.getItineraryDetails(this.itinerary_details.id);
            }
        },
    }
</script>

<style>
</style>
