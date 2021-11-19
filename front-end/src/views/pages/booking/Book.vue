<template>
    <div class="animated fadeIn container">
        <div class="mt-2 mx-0 px-3 animated fadeIn">
            <b-row class="m-0">
                <b-col sm="12" md="12" lg="8">
                    <div class="steps-holder d-flex align-items-center justify-content-center">
                        <template v-for="load_component in registered_component">
                            <div v-if="load_component.connector" class="dot-connector" :class="load_component.id<=selected_component.id ? 'dot-success' : ''"></div>
                            <div :class="load_component.id<=selected_component.id ? 'dot-success' : ''" class="dot  d-flex align-items-center justify-content-center" @click="loadComponent(load_component)">
                                {{ load_component.id }}
                                <span class="step-description">{{ load_component.label }}</span>
                            </div>
                        </template>
                    </div>
                </b-col>
            </b-row>
            <b-row class="m-0">
                <b-col sm="12" md="12" lg="8" class="shadow bg-white p-3">
                    <component
                            ref="stepsComponent"
                            @nextStep="nextComponent"
                            @changeLoadStatus="changeLoadStatus"
                            @paymentCompleted="book"
                            :is="selected_component.component"
                            :booking_details="booking_details"
                            :other_data="other_data"
                            :total_amount_due="total_amount_due"
                    />
                </b-col>
                <b-col class="p-0">
                    <div class="shadow ml-lg-3 ml-0 mt-lg-0 mt-3 bg-white">
                        <b-row class="bg-primary border border-secondary m-0">
                            <b-col class="p-2">
                                <strong>
                                    BOOKING SUMMARY
                                </strong>
                            </b-col>
                        </b-row>
                        <template v-if="booking_details.itinerary.hasOwnProperty('itinerary_boat')">
                            <div class="bg-white p-3">
                                <b-list-group>
                                    <b-list-group-item class="p-2">
                                        <h6 class="text-primary mb-0">Boat Model</h6>
                                        <h5 class="mb-0 pb-0 font-weight-bold">
                                            {{booking_details.itinerary.itinerary_boat.boat_brand.name}}
                                            <span class="text-muted d-block h6">{{booking_details.itinerary.itinerary_boat.boat_type.name}}</span>
                                        </h5>
                                    </b-list-group-item>
                                    <b-list-group-item class="p-2">
                                        <h6 class="text-primary mb-0">Check In</h6>
                                        <h5 class="mb-0 pb-0 font-weight-bold">
                                            {{booking_details.itinerary.itinerary_city_from.name}}
                                            <span class="text-muted d-block h6 mb-0">{{booking_details.itinerary.port_from.name}}</span>
                                            <span class="d-block h6">{{booking_details.itinerary.check_in.other_formats.format_2}}</span>
                                        </h5>
                                    </b-list-group-item>
                                    <b-list-group-item class="p-2">
                                        <h6 class="text-primary mb-0">Check Out</h6>
                                        <h5 class="mb-0 pb-0 font-weight-bold">
                                            {{booking_details.itinerary.itinerary_city_to.name}}
                                            <span class="text-muted d-block h6 mb-0">{{booking_details.itinerary.port_to.name}}</span>
                                            <span class="d-block h6">{{booking_details.itinerary.check_out.other_formats.format_2}}</span>
                                        </h5>
                                    </b-list-group-item>
                                </b-list-group>
                            </div>
                        </template>
                    </div>

                    <!-- <div class="shadow ml-3 mt-2 bg-white" v-if="selected_component.id==2">
                      <b-row class="bg-primary border border-secondary m-0">
                          <b-col class="p-2">
                              <strong>
                                  BOOKING DETAILS
                              </strong>
                          </b-col>
                      </b-row>
                        <div class="bg-white p-3">
                          <guests
                              :guests="booking_details.guests"
                          />
                          <table class="table table-sm table-bordered m-0">
                          <thead>
                              <tr>
                                  <th scope="col" colspan="3">ADD ONS</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td scope="col" class="text-muted">Description</td>
                                  <td scope="col" class="text-muted">Qty</td>
                                  <td scope="col" class="text-right text-muted">Amount</td>
                              </tr>
                              <tr v-for="add_on in booking_details.add_ons" v-if="add_on.is_selected">
                                  <td>{{add_on.description}} @&euro;{{add_on.price.toLocaleString('en-US',{ minimumFractionDigits: 2 })}} each</td>
                                  <td>{{add_on.qty.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</td>
                                  <td>&euro;{{(add_on.price*add_on.qty).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</td>
                              </tr>
                          </tbody>
                          </table>
                        </div>
                    </div> -->
                    <div class="shadow ml-lg-3 ml-0 mt-3 bg-white">
                        <b-row class="bg-success border border-secondary m-0">
                            <b-col class="p-2 text-center">
                                <strong>
                                    TOTAL
                                </strong>
                            </b-col>
                        </b-row>
                        <div class="bg-white p-3 text-center">
                            <h1><strong>&euro; {{total_amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong></h1>
                        </div>
                    </div>
                </b-col>
            </b-row>
            <b-row class="mt-4 mb-4 mx-0">
                <b-col md="8" class="mx-0 px-0">
                    <b-row>
                        <b-col>
                            <button v-if="selected_component.show_prev" @click="prev" type="button" class="btn btn-primary btn-sm mr-2 prev-next-btn">
                                <strong><i class="fa fa-angle-double-left"></i> PREV</strong>
                            </button>
                        </b-col>
                        <b-col class="text-right">
                            <button v-if="selected_component.show_next" @click="next" type="button" class="btn btn-primary btn-sm prev-next-btn">
                                <strong>NEXT <i class="fa fa-angle-double-right"></i>
                                </strong>
                            </button>
                            <button v-else-if="!selected_component.show_next && booking_details.payment_type==3" @click="book" type="button" class="btn btn-success btn-sm prev-next-btn">
                                <strong>SUBMIT BOOKING <i class="fa fa-angle-double-right"></i>
                                </strong>
                            </button>
                        </b-col>
                    </b-row>
                </b-col>
            </b-row>
        </div>
        <b-row align-v="center" class="check-out-loader m-0" v-if="loading">
            <b-col>
                <b-spinner></b-spinner>
                <br><br>
                <strong>Loading</strong>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js';
    import Step1 from './Step1';
    import Step2 from './Step2';
    import Step3 from './Step3';
    import Guests from './Guests.vue';
    export default {
        name: 'Book',
        mixins:[SwalMixin],
        components:{
            Step1,
            Step2,
            Step3,
            Guests
        },
        data(){
            return{
                selected_component:{},
                registered_component:[
                    {id: 1, label:'Guest Details', component: 'Step1',connector:false,enabled:true,show_prev:false,show_next:true},
                    {id: 2, label:'Cabin Selection', component: 'Step2',connector:true,enabled:false,show_prev:true,show_next:true},
                    {id: 3, label:'Payment', component: 'Step3',connector:true,enabled:true,show_prev:true,show_next:false}
                ],
                other_data:{},
                booking_details:{
                    itinerary:{},
                    guests:[],
                    number_of_guest:0,
                    number_of_guest_to_select:0,
                    add_ons:[],
                    payment_terms:-1,
                    grand_total:0,
                    deposit_amount_due:0,
                    lead_source_id: -1,
                    payment_type:3, //default is BANK TRANSFER
                    promo_code:{
                        is_active:false,
                        code:'',
                        discount_amount:0
                    },
                    user:{
                        password:{
                            value:'',
                            error:false
                        },
                        email:''
                    },
                    payment_details:{},
                    discounts:[]
                },
                loading:false
            }
        },
        computed: {
            total_amount_due(){
                //return 0;
                let due=(this.total_rooms_due + this.total_add_ons_due)-this.total_discounts;
                if(due<0)
                    return 0;

                return due;
            },
            total_rooms_due(){
                return this.booking_details.itinerary.itinerary_cabins_for_booking.reduce((total, value)=>{
                    return total + Number(value.user_selection.price);
                },0);
            },
            total_add_ons_due(){
                return this.booking_details.add_ons.reduce((total, value)=>{
                    if(value.is_selected){
                        let add_ons_due = total +(Number(value.price) * Number(value.qty));
                        if(add_ons_due<0)
                            return 0;

                        return add_ons_due;
                    }


                    return total;
                },0);
            },
            total_discounts(){
                return this.booking_details.discounts.reduce((total, value)=>{
                    return total + Number(value.total);
                },0);
            },
            loggedIn(){
                return this.$store.getters.loggedInAsGuest
            },
        },
        mounted(){
            if(!this.booking_details.itinerary.hasOwnProperty('is_referral_active'))
                return;


            if(JSON.parse(this.booking_details.itinerary.is_referral_active) && this.booking_details.number_of_guest.value>1){
                let data = {}
                let amount = this.booking_details.itinerary.referral_price;
                let qty = this.booking_details.number_of_guest.value - 1;
                data.qty = qty;
                data.discount_description = 'Bring a Friend Promo ('+qty+' friend/s)';

                data.amount = amount;
                data.total = amount * qty;
                this.booking_details.discounts.push(data);
            }
        },
        created() {
            if(!this.$route.params.hasOwnProperty('itinerary')){
                this.$router.push('/booking');
            }else{
                this.selected_component = this.registered_component[0];
                this.booking_details.itinerary=this.$route.params.itinerary;
                this.booking_details.promo_code.is_active=this.$route.params.has_promo_code;
                this.booking_details.lead_source_id=this.$route.params.lead_source_id;

                if(this.$route.params.has_promo_code){
                    this.booking_details.promo_code.code=this.$route.params.promo_code.value;
                    this.booking_details.promo_code.discount_amount=this.$route.params.promo_code.discount_amount;
                }
                this.booking_details.number_of_guest=this.$route.params.number_of_guest;
                this.booking_details.number_of_guest_to_select=this.$route.params.number_of_guest.value;
                this.other_data.guest_titles=this.$route.params.guest_titles;
                this.other_data.nationalities=this.$route.params.nationalities;
                this.addGuest(this.$route.params);

                this.reAssignAddOns();
            }
        },
        methods:{
            addGuest(params){
                for (let i = 0; i < params.number_of_guest.value; i++) {

                    let guest={};
                    if(i==0){
                        if(this.loggedIn){
                            
                            let main_guest = this.$store.getters.userDetails.guest_lists.find(x => x.user_id !== null)
                            guest.db_id = main_guest.id;
                            guest.guest_title_id={value:main_guest.guest_title_id,error:false};
                            guest.first_name={value:main_guest.first_name,error:false};
                            guest.last_name={value:main_guest.last_name,error:false};
                            guest.country_code={value:main_guest.country_code_id,error:false};
                            guest.phone_number={value:main_guest.phone_number,error:false};
                            guest.email={value:main_guest.email,error:false};

                            guest.default=true;
                            guest.is_selected=true;
                            guest.main_guest=true;
                        }else{
                            guest.db_id = -1;
                            guest.guest_title_id=params.guest_title_id;
                            guest.first_name=params.first_name;
                            guest.last_name=params.last_name;
                            guest.country_code=params.country_code;
                            guest.phone_number=params.phone_number;
                            guest.email=params.email;
                            guest.default=true;
                            guest.is_selected=true;
                            guest.main_guest=true;
                        }
                    }else{
                        guest.db_id = -1;
                        guest.guest_title_id={value:'',error:false};
                        guest.first_name={value:'',error:false};
                        guest.last_name={value:'',error:false};
                        guest.country_code={value:'',error:false};
                        guest.phone_number={value:'',error:false};
                        guest.email={value:'',error:false};
                        guest.default=false;
                        guest.is_selected=false;
                        guest.main_guest=false;
                    }

                    let cabin={};
                    cabin.id=-1;

                    guest.cabin=cabin;

                    let cabin_select={};
                    cabin_select.id=-1;

                    guest.cabin_select=cabin_select;
                    guest.selected_child_index=-1;
                    guest.removed_from_child=false;
                    guest.cabin_type=-1;

                    guest.id=i;
                    guest.occupancy=0;
                    guest.amount_due=0;
                    guest.original_amount_due=0;
                    guest.discounts=[];
                    this.booking_details.guests.push(guest);
                }

            },

            next(){
                this.loading=true;
                if(this.selected_component.id==1 || this.selected_component.id==2){

                    this.$refs.stepsComponent.validateInputs();
                }else{

                    this.nextComponent();
                }

            },
            prev(){
                let current_component=this.selected_component;
                let current_component_index=this.registered_component.indexOf(current_component);

                //change component
                let next_component = this.registered_component[current_component_index-1];
                this.selected_component=next_component;
            },
            nextComponent(){
                let current_component=this.selected_component;
                let current_component_index=this.registered_component.indexOf(current_component);

                //change component
                let next_component = this.registered_component[current_component_index+1];
                this.selected_component=next_component;
            },
            reAssignAddOns(){
                let data = JSON.parse(JSON.stringify(this.booking_details.itinerary.add_ons));
                data.forEach((val)=>{
                    val.is_selected = false;
                    val.qty = 1;
                    this.booking_details.add_ons.push(val);
                });
            },
            // tryme(){
            //     this.booking_details.itinerary.itinerary_cabins_for_booking.forEach((value,index) => {
            //         if(value.user_selection.cabin_type!=-1){
            //             let counter=0;
            //             let amount_due=0;
            //             let occupancy=0;
            //             if(value.user_selection.cabin_type==3){
            //                 amount_due = value.user_selection.price/2;
            //                 counter=2;
            //                 occupancy = value.user_selection.occupancy/2;
            //             }else{
            //                 amount_due = value.user_selection.price;
            //                 counter=1;
            //                 occupancy = value.user_selection.occupancy;
            //             }
            //             while(counter>0){
            //                 this.booking_details.guests.forEach((row_guest_value,row_guest_index) => {
            //                     if(row_guest_value.cabin.id==-1){
            //                         this.booking_details.guests[row_guest_index].cabin=value;
            //                         this.booking_details.guests[row_guest_index].amount_due=amount_due;
            //                         this.booking_details.guests[row_guest_index].occupancy=occupancy;
            //                         counter--;
            //                         return;
            //                     }
            //                 });
            //             }
            //         }
            //     });
            // },
            book(){
                this.loading=true;
                this.booking_details.grand_total = this.total_amount_due;
                //     this.booking_details.itinerary.itinerary_cabins_for_booking.forEach((value,index) => {
                //         if(value.user_selection.cabin_type!=-1){
                //             let counter=0;
                //             let amount_due=0;
                //             let occupancy=0;
                //             if(value.user_selection.cabin_type==3){
                //                 amount_due = value.user_selection.price/2;
                //                 counter=2;
                //                 occupancy = value.user_selection.occupancy/2;
                //             }else{
                //                 amount_due = value.user_selection.price;
                //                 counter=1;
                //                 occupancy = value.user_selection.occupancy;
                //             }
                //             while(counter>0){
                //                 this.booking_details.guests.forEach((row_guest_value,row_guest_index) => {
                //                     if(row_guest_value.cabin.id==-1){
                //                         this.booking_details.guests[row_guest_index].cabin=value;
                //                         this.booking_details.guests[row_guest_index].amount_due=amount_due;
                //                         this.booking_details.guests[row_guest_index].occupancy=occupancy;
                //                         counter--;
                //                         return;
                //                     }
                //                 });
                //             }
                //         }
                //     });
                this.axios.post('booking/save',this.booking_details).then(response => {

                    this.loading=false;
                    this.axios.defaults.headers.common['Authorization']= 'Bearer '+response.data.token;
                    this.$router.push(
                        {
                            name: 'ThankYou',
                            params: { id: response.data.booking_details.id, token: response.data.token }
                        });
                }).catch(error => {
                    this.swalRequestError();
                    this.loading=false;
                });
                
            },
            changeLoadStatus(status){
                this.loading=status;
            }
        }
    }
</script>

<style>

    .cursor-pointer{
        cursor: pointer;
    }
    .payment-terms:hover, .selected-payment-terms{
        background:#20a8d8 ;
        color:#fff!important;
    }
    .steps-component-holder{
        position: relative;
    }
    .steps-holder{
        margin-bottom: 40px;
    }
    .dot {
        background-color: #fff;
        border-radius: 50%;
        display: inline-block;
        color:#2c3f4c;
        text-align:center;
        height:45px;
        width:45px;
        font-size:16px;
        position:relative;
        cursor:pointer;
    }
    .step-description{
        position: absolute;
        top: 105%;
        width:150px;
        color:#2c3f4c;
        font-size: 14px;
    }
    .dot-connector{
        display: inline-block;
        background-color: #fff;
        width:150px;
        height:5px;
    }
    .dot-success{
        background:#96c03d!important;
        color:#fff!important;
        font-weight:bold;
    }
    .prev-next-btn{
        width: 140px;
    }
    .create-btn{
        width: 170px;
    }
</style>
