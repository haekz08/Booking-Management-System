<template>
    <div>
        <b-row class="m-0 align-items-end">
            <b-col class="p-0">
                <img :src="logo" class="medsailing-logo-print" alt="Medsailing Logo">
            </b-col>
            <b-col sm="6" class="text-center">
                <h6 class="mb-0">MED SAILING HOLIDAYS CY LTD</h6>
                <p class="mb-0">Karantoki Building, 5th floor, Flat/Office 13 Nicosia, Larnaka 1065 Cyprus</p>
                <p class="mb-0">
                    Contact Number : +44 20 3289 9366
                </p>
            </b-col>
            <b-col class="p-0 text-right">
                <h6 class="mb-0 text-muted">Booking Reference</h6>
                <h2><strong>{{booking_details.reference_code_char}}{{booking_details.reference_code}}</strong></h2>
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
                                {{booking_details.itinerary_details.itinerary_brand.description}}
                                <span class="text-muted d-block h6">{{booking_details.itinerary_details.itinerary_country.name}}</span>
                            </h3>
                        </b-col>
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Boat Model</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{booking_details.itinerary_details.itinerary_boat.boat_brand.name}}
                                <span class="text-muted d-block h6">{{booking_details.itinerary_details.itinerary_boat.boat_type.name}}</span>
                            </h3>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Check In</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{booking_details.itinerary_details.itinerary_city_from.name}}
                                <span class="text-muted d-block h6">{{booking_details.itinerary_details.port_from.name}}</span>
                            <span class="d-block h6">{{booking_details.itinerary_details.check_in.other_formats.format_2}}</span>
                            </h3>
                        </b-col>
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Check Out</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{booking_details.itinerary_details.itinerary_city_to.name}}
                                <span class="text-muted d-block h6">{{booking_details.itinerary_details.port_to.name}}</span>
                            <span class="d-block h6">{{booking_details.itinerary_details.check_out.other_formats.format_2}}</span>
                            </h3>
                        </b-col>
                    </b-row>
                </div>

                <b-row class="bg-primary border border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            GUEST DETAILS
                        </strong>
                    </b-col>
                </b-row>
                <b-row class="border border-secondary border-top-0 bg-white m-0">
                    <b-col class="p-0">
                        <div v-for="(guest, index) in booking_details.guests" class="d-block p-2 m-2 rounded border border-socondary bg-white no-break-inside">
                            <b-row class="m-0">
                                <b-col md="6" class="p-0">
                                    <h5 class="mb-0 pb-0 font-weight-bold text-uppercase text-primary">
                                    {{(guest.guest_details.last_name!='') ? guest.guest_details.last_name : 'Guest ' + (index+1)}},
                                    </h5>
                                    <h6 class="text-uppercase mb-1 text-primary">{{(guest.guest_details.first_name!='') ? guest.guest_details.first_name : 'Guest'}}</h6>
                                </b-col>
                                <b-col md="6" class="p-0">
                                    <h5 class="mb-0 pb-0 font-weight-bold">
                                        {{guest.guest_cabin_details.cabin_description.cabin_type.name}} - {{guest.guest_cabin_details.cabin_description.code}}
                                    </h5>
                                    <h6 class="mb-1">
                                        Occupancy ({{guest.occupancy}})
                                    </h6>
                                </b-col>
                            </b-row>
                            <b-row class="m-0 border-top">
                                <b-col md="12" class="p-0 pt-2">
                                    <b-row class="m-0 mb-2">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Date of Birth</strong>
                                            <p class="m-0">{{guest.guest_details.birth_date.default=='' ? 'none':guest.guest_details.birth_date.other_formats.format_1}}</p>
                                        </b-col>
                                        <b-col class="p-0">
                                            <strong class="text-muted">Age</strong>
                                            <p class="m-0">{{guest.guest_details.birth_date.other_formats.format_2=='' ? 'none':guest.guest_details.birth_date.other_formats.format_2}}</p>
                                        </b-col>
                                    </b-row>
                                    <b-row class="m-0 mb-2">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Email</strong>
                                            <p class="m-0">{{guest.guest_details.email=='' ? 'none':guest.guest_details.email}}</p>
                                        </b-col>
                                        <b-col class="p-0">
                                            <strong class="text-muted">Phone Number</strong>
                                            <p class="m-0">{{guest.guest_details.phone_number=='' ? 'none':guest.guest_details.phone_number}}</p>
                                        </b-col>
                                    </b-row>
                                    <b-row class="m-0 mb-2">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Passport Number</strong>
                                            <p class="m-0">{{guest.guest_details.passport_number=='' ? 'none':guest.guest_details.passport_number}}</p>
                                        </b-col>
                                        <b-col class="p-0">
                                            <strong class="text-muted">Expiration Date</strong>
                                            <p class="m-0">{{guest.guest_details.expiration_date=='' ? 'none':guest.guest_details.expiration_date}}</p>
                                        </b-col>
                                    </b-row>
                                    
                                    <b-row class="m-0 mb-2">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Place of Birth</strong>
                                            <p class="m-0">{{guest.guest_details.pob_country=='' ? 'none':guest.guest_details.pob_country}}, {{guest.guest_details.pob_city=='' ? 'none':guest.guest_details.pob_city}}</p>
                                        </b-col>
                                        <b-col class="p-0">
                                            <strong class="text-muted">Current Residency</strong>
                                            <p class="m-0">{{guest.guest_details.current_residency=='' ? 'none':guest.guest_details.current_residency}}</p>
                                        </b-col>
                                    </b-row>
                                    <b-row class="m-0 mb-2">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Nationality</strong>
                                            <p class="m-0">{{guest.guest_details.nationality_id=='' ? 'none':guest.guest_details.nationality_details.description}}</p>
                                        </b-col>
                                    </b-row>
                                    <b-row class="m-0 mb-2">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Medical Issues</strong>
                                            <p class="m-0">{{guest.guest_details.medical_issues=='' ? 'none':guest.guest_details.medical_issues}}</p>
                                        </b-col>
                                    </b-row>
                                    <b-row class="m-0 mb-2">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Allergies</strong>
                                            <p class="m-0">{{guest.guest_details.allergies=='' ? 'none':guest.guest_details.allergies}}</p>
                                        </b-col>
                                    </b-row>
                                    <b-row class="m-0">
                                        <b-col class="p-0">
                                            <strong class="text-muted">Diet</strong>
                                            <p class="m-0">{{guest.guest_details.diet=='' ? 'none':guest.guest_details.diet}}</p>
                                        </b-col>
                                    </b-row>
                                </b-col>
                            </b-row>
                        </div>
                    </b-col>
                </b-row>
                <!-- <div class="border border-secondary border-top-0 bg-white px-2 py-1">
                    
                    <b-row class="m-0 px-2 py-1">
                        <b-col v-for="(guest, index) in booking_details.guests" md="12" class="p-2 my-1 rounded border border-socondary bg-white no-break-pls">
                            
                        </b-col>
                    </b-row>
                </div> -->


                <b-row class="bg-primary border border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            ADD ONS
                        </strong>
                    </b-col>
                </b-row>
                <div class="border border-secondary border-top-0 bg-white p-1">
                    <b-row class="m-0 px-2 py-1">
                        <b-col v-for="add_on in booking_details.add_ons" md="12" class="p-2 my-1 rounded border border-socondary bg-white">
                            <b-row class="d-flex align-items-center">
                            <b-col md="7">
                                <h6 class="mb-0 pb-0 font-weight-bold text-uppercase">
                                ({{add_on.qty.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}){{add_on.details.description}}
                                </h6>
                                <h6 class="mb-0">@ &euro;{{add_on.price.toLocaleString('en-US',{ minimumFractionDigits: 2 })}} each</h6>
                            </b-col>
                            <b-col class="text-right">
                                <strong class="d-block text-muted">
                                TOTAL
                                </strong>
                                <span class="d-block h6">
                                &euro;{{(add_on.price*add_on.qty).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                </span>
                            </b-col>
                            </b-row>
                        </b-col>
                    </b-row>
                </div>


                <b-row class="bg-primary border border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            INCLUSIONS
                        </strong>
                    </b-col>
                </b-row>
                <div class="border border-secondary border-top-0 bg-white p-1">
                    <b-row class="m-0 px-2 py-1">
                        <b-col v-for="inclusion in booking_details.itinerary_details.inclusions" md="12" class="p-2 my-1 rounded border border-socondary">
                            <b-row class="d-flex align-items-center">
                              <b-col>
                                <h6 class="mb-0 pb-0 font-weight-bold">
                                  <i class="fa fa-fw fa-check text-success"></i> {{inclusion.description}}
                                </h6>
                              </b-col>
                            </b-row>
                        </b-col>
                    </b-row>
                </div>

                <b-row class="bg-primary border border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            EXCLUSIONS
                        </strong>
                    </b-col>
                </b-row>
                <div class="border border-secondary border-top-0 bg-white p-1">
                    <b-row class="m-0 px-2 py-1">
                        <b-col v-for="exclusion in booking_details.itinerary_details.exclusions" md="12" class="p-2 my-1 rounded border border-socondary">
                            <b-row class="d-flex align-items-center">
                              <b-col>
                                <h6 class="mb-0 pb-0 font-weight-bold">
                                  <i class="fa fa-fw fa-close text-danger"></i> {{exclusion.description}}
                                </h6>
                              </b-col>
                            </b-row>
                        </b-col>
                    </b-row>
                </div>




            </b-col>
        </b-row>
    </div>
</template>

<script>
    export default {
        name: "PrintIndex",
        data(){
            return {
                booking_details:{},
                logo: require('../../../../public/img/medsailing-logo.png'),
            }
        },
        created(){
            //this.$route.params.booking_id;
            this.getBookingDetails(this.$route.params.booking_id);
        },
        mounted(){
            
        },
        methods:{
            getBookingDetails(booking_id){
                this.axios.get('bookings/get',{params:{booking_id:booking_id}}).then(response => {
                    this.$nextTick(()=>{
                        this.booking_details=response.data.booking;
                        this.$nextTick(()=>{
                            this.$emit('print');
                        });
                    });
                }).catch(error => console.log(error));
            }
        },
    }
</script>

<style>
</style>