<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col>
                <itineraries-table
                        :fields="table_settings.fields"
                        :api_url="table_settings.api_url"
                        :delete_url="table_settings.delete_url"
                        ref="displayTable"
                        top_right_btn="Create Itinerary"
                />
            </b-col>
        </b-row>
        <!-- Modal Component -->
        <b-modal header-text-variant="light"
                header-bg-variant="primary"
                v-model="itinerary_details_modal"
                size="xl"
                body-class="p-0"
                no-close-on-backdrop no-close-on-esc
                hide-footer>
                <template slot="modal-title">
                    <div>
                    <h5><i class='fa fa-fw fa-file-text'></i>BOOKING SUMMARY</h5>
                    </div>
                </template>
                <b-row class="m-0" v-if="itinerary_details_modal">
                    <b-col md="3" class="p-2">
                        <b-row class="bg-primary border border-secondary m-0">
                            <b-col class="p-2">
                                <strong>
                                ITINERARY DETAILS
                                </strong>
                            </b-col>
                        </b-row>
                            <template>
                            <div class="border border-secondary border-top-0 bg-white p-2">
                                <b-list-group>
                                <b-list-group-item class="p-2">
                                    <h6 class="text-primary mb-1">Itinerary Brand</h6>
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                    {{selected_itinerary.itinerary_brand.description}}
                                    <span
                                        class="text-muted d-block h6">{{selected_itinerary.itinerary_country.name}}</span>
                                    </h5>
                                </b-list-group-item>
                                <b-list-group-item class="p-2">
                                    <h6 class="text-primary mb-1">Boat Model</h6>
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                    {{selected_itinerary.itinerary_boat.boat_brand.name}}
                                    <span class="text-muted d-block h6">{{selected_itinerary.itinerary_boat.boat_type.name}}</span>
                                    </h5>
                                </b-list-group-item>
                                <b-list-group-item class="p-2">
                                    <h6 class="text-primary mb-1">Check In</h6>
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                    {{selected_itinerary.itinerary_city_from.name}}
                                    <span class="text-muted d-block h6">{{selected_itinerary.port_from.name}}</span>
                                    <span
                                        class="d-block h6">{{selected_itinerary.check_in.other_formats.format_2}}</span>
                                    </h5>
                                </b-list-group-item>
                                <b-list-group-item class="p-2">
                                    <h6 class="text-primary mb-1">Check Out</h6>
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                    {{selected_itinerary.itinerary_city_to.name}}
                                    <span class="text-muted d-block h6">{{selected_itinerary.port_to.name}}</span>
                                    <span
                                        class="d-block h6">{{selected_itinerary.check_out.other_formats.format_2}}</span>
                                    </h5>
                                </b-list-group-item>
                                <b-list-group-item class="p-2">
                                    <h6 class="text-primary mb-1">12th week date from start of trip</h6>
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                    {{selected_itinerary.twelve_weeks_before.other_formats.format_1}}
                                    </h5>
                                </b-list-group-item>
                                </b-list-group>
                            </div>
                            </template>

                        <br>
                        <b-row class="bg-primary border border-secondary m-0">
                            <b-col class="p-2">
                                <strong>
                                ITINERARY CREWS
                                </strong>
                            </b-col>
                        </b-row>
                            <template>
                            <div class="border border-secondary border-top-0 bg-white p-2">
                                <b-list-group>
                                <b-list-group-item class="p-2">
                                    <h6 class="text-primary mb-1">Ambassador/ Yoga Instructor</h6>
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                    {{(selected_itinerary.itinerary_ambassador != null) ? selected_itinerary.itinerary_ambassador.full_name : ''}}
                                    </h5>
                                </b-list-group-item>
                                <b-list-group-item class="p-2" v-for="(crew, index) in selected_itinerary.itinerary_crews">
                                    <h6 class="text-primary mb-1">{{crew.crew_type.description}}</h6>
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                    {{crew.full_name}}
                                    </h5>
                                </b-list-group-item>
                                </b-list-group>
                            </div>
                            </template>
                    </b-col>
                    <b-col class="p-2">
                        <template v-for="booking in selected_itinerary.itinerary_bookings">
                        <b-row class="bg-primary border border-secondary m-0">
                            <b-col class="p-2">
                                <strong>
                                Booking Reference : {{booking.reference_code_char}}{{booking.reference_code}}
                                </strong>
                            </b-col>
                        </b-row>
                        <div class="border border-secondary border-top-0 bg-white p-2">
                            <b-row class="m-0">
                                <b-col class="p-0">
                                    <div class="shadow mb-2 bg-white">
                                        <b-row class="bg-warning border border-secondary m-0">
                                        <b-col class="p-2 text-center">
                                            <strong>
                                            TOTAL
                                            </strong>
                                        </b-col>
                                        </b-row>
                                        <div class="bg-white py-2 text-center">
                                        <h4 class="mb-0"><strong>{{booking.active_invoice.grand_total.other_formats.format_1}}</strong></h4>
                                        </div>
                                    </div>
                                </b-col>
                                <b-col class="p-0">
                                    <div class="shadow ml-2 mb-2 bg-white">
                                        <b-row class="bg-success border border-secondary m-0">
                                        <b-col class="p-2 text-center">
                                            <strong>
                                            PAID
                                            </strong>
                                        </b-col>
                                        </b-row>
                                        <div class="bg-white py-2 text-center">
                                        <h4 class="mb-0"><strong>{{booking.total_payment.other_formats.format_1}}</strong></h4>
                                        </div>
                                    </div>
                                </b-col>
                                <b-col class="p-0">
                                    <div class="shadow ml-2 mb-2 bg-white">
                                        <b-row class="bg-danger border border-secondary m-0">
                                        <b-col class="p-2 text-center">
                                            <strong>
                                            OUTSTANDING
                                            </strong>
                                        </b-col>
                                        </b-row>
                                        <div class="bg-white py-2 text-center">
                                        <h4 class="mb-0"><strong>{{booking.booking_balance.other_formats.format_1}}</strong></h4>
                                        </div>
                                    </div>
                                </b-col>
                            </b-row>
                            <table class="table">
                            <thead>
                                <tr>
                                <th scope="col">#</th>
                                <th scope="col">First</th>
                                <th scope="col">AB</th>
                                <th scope="col">CL</th>
                                <th scope="col">Cabin</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(guest, index) in booking.guests">
                                    <th scope="row">{{index+1}}</th>
                                    <td>{{(guest.guest_details.full_name!='' && guest.guest_details.full_name!=' ') ? guest.guest_details.full_name : 'Guest'}}</td>
                                    <td>
                                        <strong :class="{'text-danger':booking.ambassador_itinerary_code_id==null , 'text-success':booking.ambassador_itinerary_code_id!=null}">{{(booking.ambassador_itinerary_code_id!=null) ? 'YES' : 'NO'}}</strong>
                                    </td>
                                    <td><strong :class="{'text-danger':guest.guest_details.details_complete == 'NO' , 'text-success':guest.guest_details.details_complete == 'YES'}">{{guest.guest_details.details_complete}}</strong></td>
                                    <td>
                                    {{guest.guest_cabin_details.cabin_description.cabin_type.name}} - {{guest.guest_cabin_details.cabin_description.code}}    
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                        </div>
                        <br>
                        </template>
                        <template v-if="selected_itinerary.itinerary_bookings.length==0">
                            <b-row class="bg-primary border border-secondary m-0">
                                <b-col class="p-2">
                                    <strong>
                                    No Bookings Yet
                                    </strong>
                                </b-col>
                            </b-row>
                            <div class="border border-secondary border-top-0 bg-white p-2 text-center">
                                &nbsp;
                            </div>
                        </template>
                    </b-col>
                </b-row>
        </b-modal>
    </div>
</template>


<script>
    import {bus} from '@/main.js';
    import ItinerariesTable from './ItinerariesTable.vue';
    export default{
        components:{
          ItinerariesTable
        },
        data(){
            return {
                table_settings:{
                    api_url:'itinerary/get_all',
                    delete_url:'test',
                    fields:[
                        {key: 'crews', label:'Crews'},
                        {key: 'ambassador', label:'Ambassador'},
                        {key: 'twelve_weeks_before.other_formats.format_1', label:'12th week mark'},
                        {key: 'boat_name', label:'Boat Name'},
                        {key: 'type_of_trip', label:'Type of Trip'},
                        {key: 'itinerary_country.name', label:'Country'},
                        {key: 'itinerary_city_from.name', label:'City From'},
                        {key: 'itinerary_city_to.name', label:'City To'},
                        {key: 'check_in.other_formats.format_1', label:'Date'},
                        {key: 'slots_remaining', label:'Sold Place/s'},
                        {key: 'details_complete', label:'CL'},
                        {key: 'total_booking_balance.other_formats.format_1', label:'Outstanding'},
                    ]
                },
                itinerary_details_modal:false,
                selected_itinerary:{}
            }
        },
        methods:{
        },
        created(){
            bus.$on('serverSidePaginatedTableTopRightBtnClicked', ()=>{

            });
            bus.$on('serverSidePaginatedTableDbClick', (data)=>{
                this.itinerary_details_modal=true;
                this.selected_itinerary=data;
            });
        }
    }
</script>

<style scoped>

</style>
