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
                            <th scope="col">Passport Details</th>
                            <th scope="col">Other Details</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-if="itinerary_details.ambassador_id!=-1">
                            <td>
                                <span class="text-muted">Name : </span>{{(itinerary_details.itinerary_ambassador.full_name!=' ') ? itinerary_details.itinerary_ambassador.full_name : 'Guest'}}
                                | 
                                <b-badge variant="warning">
                                    Brand Ambassador/Yoga Instructor
                                </b-badge>
                                <br>
                                <span class="text-muted">Birth Date : </span>{{itinerary_details.itinerary_ambassador.birth_date.default=='' ? 'none':itinerary_details.itinerary_ambassador.birth_date.other_formats.format_1}} | {{itinerary_details.itinerary_ambassador.birth_date.other_formats.format_2==0 ? 'none':itinerary_details.itinerary_ambassador.birth_date.other_formats.format_2+' years old.'}}<br>
                                <span class="text-muted">Contact Details : </span>{{itinerary_details.itinerary_ambassador.phone_number=='' ? 'none':itinerary_details.itinerary_ambassador.phone_number}} | {{itinerary_details.itinerary_ambassador.email=='' ? 'none':itinerary_details.itinerary_ambassador.email}}<br>
                            </td>
                            <td>
                                <span class="text-muted">Passport # : </span>{{itinerary_details.itinerary_ambassador.passport_number=='' ? 'none':itinerary_details.itinerary_ambassador.passport_number}}<br>
                                <span class="text-muted">Exp. Date : </span>{{itinerary_details.itinerary_ambassador.expiration_date=='' ? 'none':itinerary_details.itinerary_ambassador.expiration_date}}<br>
                            </td>
                            <td>
                                <span class="text-muted">Place of Birth : </span>{{itinerary_details.itinerary_ambassador.pob_country=='' ? 'none':itinerary_details.itinerary_ambassador.pob_country}}, {{itinerary_details.itinerary_ambassador.pob_city=='' ? 'none':itinerary_details.itinerary_ambassador.pob_city}}<br>
                                <span class="text-muted">Current Residency : </span>{{itinerary_details.itinerary_ambassador.current_residency=='' ? 'none':itinerary_details.itinerary_ambassador.current_residency}}<br>
                                <span class="text-muted">Nationality : </span>{{itinerary_details.itinerary_ambassador.nationality_id=='' ? 'none':itinerary_details.itinerary_ambassador.nationality_details.description}}
                            </td>
                            <td>
                                <a class="cursor-pointer text-uppercase text-primary"
                                    @click="update_crew_modal=true">
                                    Update
                                </a>
                            </td>
                        </tr>
                        <tr v-for="(crew, index) in itinerary_details.itinerary_crews">
                            <td>
                                <span class="text-muted">Name : </span>{{(crew.full_name!=' ') ? crew.full_name : 'Guest'}}
                                | 
                                <b-badge variant="warning">
                                    {{crew.crew_type.description}}
                                </b-badge>
                                <br>
                                <span class="text-muted">Birth Date : </span>{{crew.birth_date.default=='' ? 'none':crew.birth_date.other_formats.format_1}} | {{crew.birth_date.other_formats.format_2==0 ? 'none':crew.birth_date.other_formats.format_2+' years old.'}}<br>
                                <span class="text-muted">Contact Details : </span>{{crew.phone_number=='' ? 'none':crew.phone_number}} | {{crew.email=='' ? 'none':crew.email}}<br>
                            </td>
                            <td>
                                <span class="text-muted">Passport # : </span>{{crew.passport_number=='' ? 'none':crew.passport_number}}<br>
                                <span class="text-muted">Exp. Date : </span>{{crew.expiration_date=='' ? 'none':crew.expiration_date}}<br>
                            </td>
                            <td>
                                <span class="text-muted">Place of Birth : </span>{{crew.pob_country=='' ? 'none':crew.pob_country}}, {{crew.pob_city=='' ? 'none':crew.pob_city}}<br>
                                <span class="text-muted">Current Residency : </span>{{crew.current_residency=='' ? 'none':crew.current_residency}}<br>
                                <span class="text-muted">Nationality : </span>{{crew.nationality_id=='' ? 'none':crew.nationality_details.description}}
                            </td>
                            <td>
                                <a class="cursor-pointer text-uppercase text-primary"
                                    @click="update_crew_modal=true">
                                    Update
                                </a>
                            </td>
                        </tr>
                        <template v-for="(booking, booking_index) in itinerary_details.itinerary_bookings">
                            <tr v-for="(guest, index) in booking.guests">
                                <td>
                                    <span class="text-muted">Name : </span>{{(guest.guest_details.full_name!=' ') ? guest.guest_details.full_name : 'Guest'}}<br>
                                    <span class="text-muted">Birth Date : </span>{{guest.guest_details.birth_date.default=='' ? 'none':guest.guest_details.birth_date.other_formats.format_1}} | {{guest.guest_details.birth_date.other_formats.format_2==0 ? 'none':guest.guest_details.birth_date.other_formats.format_2+' years old.'}}<br>
                                    <span class="text-muted">Contact Details : </span>{{guest.guest_details.phone_number=='' ? 'none':guest.guest_details.phone_number}} | {{guest.guest_details.email=='' ? 'none':guest.guest_details.email}}<br>
                                </td>
                                <td>
                                    <span class="text-muted">Passport # : </span>{{guest.guest_details.passport_number=='' ? 'none':guest.guest_details.passport_number}}<br>
                                    <span class="text-muted">Exp. Date : </span>{{guest.guest_details.expiration_date=='' ? 'none':guest.guest_details.expiration_date}}<br>
                                </td>
                                <td>
                                    <span class="text-muted">Place of Birth : </span>{{guest.guest_details.pob_country=='' ? 'none':guest.guest_details.pob_country}}, {{guest.guest_details.pob_city=='' ? 'none':guest.guest_details.pob_city}}<br>
                                    <span class="text-muted">Current Residency : </span>{{guest.guest_details.current_residency=='' ? 'none':guest.guest_details.current_residency}}<br>
                                    <span class="text-muted">Nationality : </span>{{guest.guest_details.nationality_id=='' ? 'none':guest.guest_details.nationality_details.description}}
                                </td>
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
    name: "Receipt",
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
            this.axios.get('itinerary/get_crew_list',{params:{itinerary_id:itinerary_id}}).then(response => {
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
