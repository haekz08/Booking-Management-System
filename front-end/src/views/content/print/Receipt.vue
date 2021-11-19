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
                <h6 class="mb-0 text-muted">Invoice Number</h6>
                <h2><strong>{{booking_details.active_invoice.invoice_number}}</strong></h2>
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
                <template>
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
                                <span class="text-muted d-block h6 mb-0">{{booking_details.itinerary_details.port_from.name}}</span>
                            <span class="d-block h6">{{booking_details.itinerary_details.check_in.other_formats.format_2}}</span>
                            </h3>
                        </b-col>
                        <b-col class="p-1">
                            <h6 class="text-primary mb-0">Check Out</h6>
                            <h3 class="mb-0 pb-0 font-weight-bold">
                                {{booking_details.itinerary_details.itinerary_city_to.name}}
                                <span class="text-muted d-block h6 mb-0">{{booking_details.itinerary_details.port_to.name}}</span>
                            <span class="d-block h6">{{booking_details.itinerary_details.check_out.other_formats.format_2}}</span>
                            </h3>
                        </b-col>
                    </b-row>
                </div>
                </template>
                <b-row class="bg-primary border border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            INVOICE DETAILS
                        </strong>
                    </b-col>
                </b-row>
                <div class="border border-secondary border-top-0 bg-white p-1">
                    <b-row class="m-0 bg-light border">
                        <b-col sm="7" class="p-2">
                            <strong class="text-muted">Item</strong>
                        </b-col>
                        <b-col sm="1" class="p-2">
                            <strong class="text-muted">Qty</strong>
                        </b-col>
                        <b-col sm="2" class="p-2">
                            <strong class="text-muted">Unit Price</strong>
                        </b-col>
                        <b-col sm="2" class="p-2 text-right">
                            <strong class="text-muted">TOTAL</strong>
                        </b-col>
                    </b-row>
                    <b-row class="m-0 border-bottom" v-for="(guest, index) in booking_details.guests">
                        <b-col sm="7" class="p-2 border-left">
                            <div>
                                {{(guest.guest_details.last_name!='') ? guest.guest_details.last_name : 'Guest ' + (index+1)}}
                            </div>
                            <div class="small text-muted">
                                <span>
                                <template>Cabin: {{guest.guest_cabin_details.cabin_description.cabin_type.name}} - {{guest.guest_cabin_details.cabin_description.code}}</template>
                                </span> | Occupancy: {{guest.occupancy}}
                            </div>
                            <div class="small text-muted" v-if="guest.discounts.length>0">
                                <span class="text-danger">Discounts:</span>
                                <span class="d-block" v-for="dicount in guest.discounts">&euro; {{dicount.total}} - {{dicount.discount_description}}</span>
                            </div>
                        </b-col>
                        <b-col sm="1" class="p-2">
                            1
                        </b-col>
                        <b-col sm="2" class="p-2 text-right">
                            <span class="h5 d-block">&euro; {{guest.total_amount_due}}</span>
                            <span class="text-line-through" v-if="guest.discounts.length>0">&euro; {{(Number(guest.total_amount_due) + Number(guest.total_discount.default)).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</span>
                        </b-col>
                        <b-col sm="2" class="p-2 border-right text-right">
                            <span class="h5 d-block">&euro; {{guest.total_amount_due}}</span>
                        </b-col>
                    </b-row>
                    <b-row class="m-0 bg-light border border-top-0">
                        <b-col sm="10" class="p-2 text-right">
                            <strong class="text-muted">SUB TOTAL</strong>
                        </b-col>
                        <b-col sm="2" class="p-2 text-right">
                            <strong class="text-muted">&euro;  {{total_rooms_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                        </b-col>
                    </b-row>


                    <b-row class="m-0 mt-3 bg-light border">
                        <b-col sm="7" class="p-2">
                            <strong class="text-muted">Add Ons</strong>
                        </b-col>
                        <b-col sm="1" class="p-2">
                            <strong class="text-muted">Qty</strong>
                        </b-col>
                        <b-col sm="2" class="p-2">
                            <strong class="text-muted">Unit Price</strong>
                        </b-col>
                        <b-col sm="2" class="p-2 text-right">
                            <strong class="text-muted">TOTAL</strong>
                        </b-col>
                    </b-row>
                    <b-row class="m-0 border-bottom" v-for="(add_on,index) in booking_details.add_ons">
                        <b-col sm="7" class="p-2 border-left">
                            <div>
                                {{index+1}}. {{add_on.details.description}}
                            </div>
                        </b-col>
                        <b-col sm="1" class="p-2">
                            {{add_on.qty.toLocaleString('en-US',{ minimumFractionDigits: 0 })}}
                        </b-col>
                        <b-col sm="2" class="p-2">
                            &euro; {{(add_on.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                        </b-col>
                        <b-col sm="2" class="p-2 border-right text-right">
                            &euro; {{(add_on.total).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                        </b-col>
                    </b-row>
                    <b-row class="m-0 bg-light border border-top-0">
                        <b-col sm="10" class="p-2 text-right">
                            <strong class="text-muted">SUB TOTAL</strong>
                        </b-col>
                        <b-col sm="2" class="p-2 text-right">
                            <strong class="text-muted">&euro; {{total_add_ons_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                        </b-col>
                    </b-row>



                    <b-row class="m-0 mt-3 bg-light border">
                        <b-col sm="10" class="p-2">
                            <strong class="text-muted">Payments Made</strong>
                        </b-col>
                        <b-col sm="2" class="p-2 text-right">
                            <strong class="text-muted">Amount Paid</strong>
                        </b-col>
                    </b-row>
                    <template v-for="invoice in booking_details.invoices">
                        <b-row class="m-0 border-bottom" v-for="(payment,index) in invoice.payments">
                            <b-col sm="10" class="p-2 border-left">
                                <div>
                                    {{payment.data_logs.create_details.date_time.other_formats.format_1}}
                                </div>
                                <div class="small text-muted">
                                    <span>
                                    <template>Receipt #: {{payment.invoice_payment_number}}</template>
                                    </span> | Payment Type: {{payment.payment_type.description}}
                                </div>
                            </b-col>
                            <b-col sm="2" class="p-2 border-right text-right">
                                {{payment.amount_paid.other_formats.format_1}}
                            </b-col>
                        </b-row>
                    </template>
                    <b-row class="m-0 bg-light border border-top-0">
                        <b-col sm="10" class="p-2 text-right">
                            <strong class="text-muted">TOTAL PAYMENT</strong>
                        </b-col>
                        <b-col sm="2" class="p-2 text-right">
                            <strong class="text-muted">{{booking_details.total_payment.other_formats.format_1}}</strong>
                        </b-col>
                    </b-row>
                </div>


                <b-row class="bg-primary border border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            INVOICE SUMMARY
                        </strong>
                    </b-col>
                </b-row>
                <div class="border border-secondary border-top-0 bg-white p-1">
                    <b-row class="m-0">
                        <b-col sm="6" class="p-0">
                            <h5 class="mb-0">For bank payments: </h5>
                            <p>
                                Please use your surname as your reference.
                            </p>
                            <p>
                                <strong>ACCOUNT NAME:</strong> Med Sailing Holidays CY Ltd <br>
                                <strong>ACCOUNT NUMBER:</strong> 357023540571<br>
                                <strong>SWIFT / BIC:</strong> BCYPCY2N / BCYPCY2NXXX <br>
                                <strong>IBAN:</strong> CY49 0020 0195 0000 3570 2354 0571 (with no spaces) <br>
                                BANK OF CYPRUS <br>
                                51 STASSINOS STREET <br>
                                AYIA PARASKEVI, STROVOLOS <br>
                                2002 NICOSIA (LEFKOSIA)
                            </p>
                        </b-col>
                        <b-col sm="6" class="p-0">
                            <b-row class="m-0 mt-5 bg-light border">
                                <b-col sm="8" class="p-2">
                                    <strong class="text-muted">INVOICE TOTAL</strong>
                                </b-col>
                                <b-col sm="4" class="p-2 text-right">
                                    <strong>&euro; {{total_amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                                </b-col>
                            </b-row>
                            <b-row class="m-0 bg-light border border-top-0">
                                <b-col sm="8" class="p-2">
                                    <strong class="text-muted">TOTAL PAYMENT</strong>
                                </b-col>
                                <b-col sm="4" class="p-2 text-right">
                                    <strong>{{booking_details.total_payment.other_formats.format_1}}</strong>
                                </b-col>
                            </b-row>
                            <b-row class="m-0 bg-light border border-top-0">
                                <b-col sm="8" class="p-2">
                                    <strong class="text-muted">OUTSTANDING BALANCE</strong>
                                </b-col>
                                <b-col sm="4" class="p-2 text-right">
                                    <strong>{{booking_details.active_invoice.invoice_balance.other_formats.format_1}}</strong>
                                </b-col>
                            </b-row>
                        </b-col>
                    </b-row>
                    <b-row class="m-0">
                        <b-col class="p-0">
                            <div class="alert alert-primary" role="alert">
                                <p>
                                    Please ensure you and your group have read and understand the terms and conditions listed on our website www.medsailingholidays.com/terms-andconditions. Extras are not included in the price (dinner, water taxis, alcohol, excursions or gratuities). There is a strict no refund policy for any cancellations under 12 weeks from departure date. Payment by credit card attracts a 4% surcharge.
                                </p>
                            </div>
                        </b-col>
                    </b-row>
                </div>



            </b-col>
        </b-row>
    </div>
</template>

<script>
    export default {
        name: "Receipt",
        data(){
            return {
                booking_details:{},
                logo: require('../../../../public/img/medsailing-logo.png')
            }
        },
        created(){
            this.getBookingDetails(this.$route.params.booking_id);
        },
        mounted(){

        },
        computed: {
            total_amount_due(){
                return this.total_rooms_due + this.total_add_ons_due;
            },
            total_rooms_due(){
                return this.booking_details.guests.reduce((total, value)=>{
                    return total + Number(value.total_amount_due);
                },0);
            },
            total_add_ons_due(){
                return this.booking_details.add_ons.reduce((total, value)=>{
                        return total +(Number(value.total));
                },0);
            }
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
