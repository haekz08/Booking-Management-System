<template>
    <div>
    <b-card no-body class="my-3">
        <b-card-header header-tag="header" class="p-2" role="tab">
            <b-button block href="#" variant="primary" @click="cabin_selection_modal=true">Cabin Selection</b-button>
        </b-card-header>
    </b-card>
    <b-card no-body class="my-3">
        <b-card-header header-tag="header" class="p-2" role="tab">
            <b-button block href="#" v-b-toggle.add-ons variant="primary">Add Ons</b-button>
        </b-card-header>
        <b-collapse id="add-ons" accordion="accordion-2" role="tabpanel">
            <b-card-body class="p-1">
                <b-card-text>
                    <b-row class="m-0">
                        <b-col md="4" class="m-0 p-1"  v-for="add_on in booking_details.add_ons">
                            <b-row class="bg-warning border border-secondary m-0 shadow">
                                <b-col class="p-2">
                                    <strong>
                                        <b-form-checkbox
                                            v-model="add_on.is_selected"
                                            :value=true
                                            :unchecked-value=false
                                            :disabled="add_on.remaining_balance<=0"
                                            >
                                            {{add_on.add_on.description}}
                                        </b-form-checkbox>
                                    </strong>
                                </b-col>
                            </b-row>
                            <div class="bg-white p-2 shadow">
                                <h6 class="text-muted">PRICE : &euro; {{Number(add_on.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</h6>
                                <h6 class="text-muted" v-if="add_on.remaining_balance>0">AVAILABLE QTY : {{add_on.remaining_balance}}</h6>
                                <h6 class="text-danger" v-else>SOLD OUT</h6>
                                <b-input-group size="sm" prepend="QTY :">
                                    <b-form-input v-model="add_on.qty" type="text" :disabled="!add_on.is_selected" @keyup="checkIfNumber(add_on)"></b-form-input>
                                </b-input-group>
                            </div>
                        </b-col>
                    </b-row>
                </b-card-text>
            </b-card-body>
        </b-collapse>
    </b-card>
    
    <b-card no-body class="my-3">
        <b-card-header header-tag="header" class="p-2" role="tab">
            <b-button block href="#" v-b-toggle.accordion-2 variant="primary">Inclusions</b-button>
        </b-card-header>
        <b-collapse id="accordion-2" accordion="accordion-3" role="tabpanel">
            <b-card-body>
                <b-card-text>
                    <b-list-group>
                        <b-list-group-item v-for="inclusion in booking_details.itinerary.inclusions"><i class="fa fa-fw fa-check text-success"></i> {{inclusion.description}}</b-list-group-item>
                    </b-list-group>
                </b-card-text>
            </b-card-body>
        </b-collapse>
    </b-card>

    <b-card no-body class="my-3">
        <b-card-header header-tag="header" class="p-2" role="tab">
            <b-button block href="#" v-b-toggle.accordion-3 variant="primary">Exclusions</b-button>
        </b-card-header>
        <b-collapse id="accordion-3" accordion="accordion-4" role="tabpanel">
            <b-card-body>
                <b-card-text>
                    <b-list-group>
                        <b-list-group-item v-for="exclusion in booking_details.itinerary.exclusions"><i class="fa fa-fw fa-close text-danger"></i> {{exclusion.description}}</b-list-group-item>
                    </b-list-group>
                </b-card-text>
            </b-card-body>
        </b-collapse>
    </b-card>

    <b-card no-body class="my-3">
        <b-card-header header-tag="header" class="p-2" role="tab">
            <b-button block href="#" v-b-toggle.accordion-4 variant="primary">Terms & Conditions</b-button>
        </b-card-header>
        <b-collapse id="accordion-4" accordion="accordion-5" role="tabpanel">
            <b-card-body>
                <b-card-text>
                    <terms-and-conditions/>
                </b-card-text>
            </b-card-body>
        </b-collapse>
    </b-card>
    <!-- Modal Component -->
        <b-modal header-text-variant="light"
                  header-bg-variant="primary"
                  v-model="cabin_selection_modal"
                  size="lg"
                  body-class="p-0"
                  centered
                  no-close-on-backdrop no-close-on-esc
                 @close="closeCabinSelectionModal"
                  hide-footer>
            <b-row class="m-0">
                <b-col class="p-0">

                    <div class="bg-white py-2 text-center" v-if="booking_details.itinerary.disclaimer!=null">
                        <div class="alert alert-primary mx-2 mb-0 text-justify">
                            {{booking_details.itinerary.disclaimer}}
                        </div>
                    </div>
                    <div class="shadow m-2 bg-white">
                        <b-row class="bg-primary border border-secondary m-0">
                            <b-col class="p-2 text-center">
                                <strong>
                                    SELECT CABIN
                                </strong>
                            </b-col>
                        </b-row>
                        <b-row class="m-0">
                            <b-col cols="6">
                                <Callout variant="info" class="shadow">
                                    <small class="text-muted">TOTAL NUMBER OF GUEST</small><br>
                                    <strong class="h4">{{booking_details.guests.length}}</strong>
                                </Callout>
                            </b-col>
                            <b-col cols="6">
                                <Callout variant="info" class="shadow">
                                    <small class="text-muted">GUESTS WITH ASSIGNED PLACES</small><br>
                                    <strong class="h4">{{booking_details.guests.length - booking_details.number_of_guest_to_select}}/{{booking_details.guests.length}}</strong>
                                </Callout>
                            </b-col>
                        </b-row>

                        <b-row class="m-0">
                            <b-col lg="6" md="12" sm="12" v-for="(cabin, index) in booking_details.itinerary.itinerary_cabins_for_booking" class="p-0">
                                <b-list-group class="m-2">
                                    <b-list-group-item
                                            class="d-block w-100 p-2 text-white bg-dark"
                                    >
                                        {{cabin.cabin_description.cabin_type.name}} - {{cabin.cabin_description.code}}
                                        <i class="fa fa-fw fa-question-circle float-right" :id="'popover-id-'+index"></i>
                                        <b-popover :target="'popover-id-'+index" triggers="hover" placement="top">
                                            <template v-slot:title>{{cabin.cabin_description.cabin_type.name}} - {{cabin.cabin_description.code}}</template>
                                            <p class="text-justify" v-if="cabin.cabin_description.cabin_description!=''">
                                                {{cabin.cabin_description.cabin_description}}
                                            </p>
                                            <p class="text-justify" v-else>
                                                No Description.
                                            </p>
                                        </b-popover>
                                    </b-list-group-item>
                                    <template v-for="(cabin_type_option,cabin_type_option_index) in cabin.cabin_type_options">
                                        <template v-if="((cabin_type_option.cabin_type==1 && !JSON.parse(booking_details.itinerary.is_shared_offered)) || (cabin_type_option.cabin_type==2 && !JSON.parse(booking_details.itinerary.is_private_offered)) || (cabin_type_option.cabin_type==1 && !JSON.parse(booking_details.itinerary.is_double_offered)) || cabin.slot_left<cabin_type_option.occupancy || booking_details.number_of_guest_to_select<=0 || cabin.user_selection.cabin_type!=-1 || cabin_type_option.min_guest_remaining>booking_details.number_of_guest_to_select) && !cabin_type_option.is_selected">
                                            <b-list-group-item
                                                    class="d-block w-100 p-0 text-muted p-2"
                                            >
                                                <b-row class="m-0" align-v="center">
                                                    <b-col cols="1" class="text-center p-0 align-middle">
                                                        <i class="fa fa-fw fa-ban h5 m-0"></i>
                                                    </b-col>
                                                    <b-col class="p-0">
                                                        <h6 class="m-0">
                                                            {{cabin_type_option.description}}
                                                            <i class="fa fa-fw fa-question-circle float-right" :id="'popover-id-'+index+'-'+cabin_type_option_index"></i>
                                                            <b-popover :target="'popover-id-'+index+'-'+cabin_type_option_index" triggers="hover" placement="top">
                                                                <template v-slot:title>{{cabin_type_option.description}}</template>
                                                                <p class="text-justify">
                                                                    {{cabin_type_option.text}}
                                                                </p>
                                                            </b-popover>
                                                        </h6>
                                                    </b-col>
                                                </b-row>
                                                <b-row class="m-0" >
                                                    <b-col offset="1" class="p-0">
                                                        <h6 class="d-block mb-0">
                                                            <strong>&euro; {{Number(cabin_type_option.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                                                            <div class="small d-inline ml-2 text-line-through" v-if="JSON.parse(booking_details.itinerary.early_bird_validity)">&euro; {{Number(cabin_type_option.original_price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</div>
                                                        </h6>
                                                    </b-col>
                                                </b-row>
                                                <!--<div class="w-100 d-flex align-items-center">-->
                                                    <!--<div class="mr-auto">-->
                                                        <!--<i class="fa fa-fw fa-ban h5"></i>-->
                                                        <!--<span>{{cabin_type_option.description}}</span>-->
                                                    <!--</div>-->
                                                    <!--<div class="">-->
                                                        <!--<i class="fa fa-fw fa-question-circle float-right" v-b-tooltip.hover :title="cabin_type_option.text"></i>-->
                                                    <!--</div>-->
                                                <!--</div>-->
                                                <!--<strong class="d-block text-danger">-->
                                                    <!--&euro; {{Number(cabin_type_option.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}-->
                                                <!--</strong>-->

                                            </b-list-group-item>
                                        </template>
                                        <template v-else>
                                            <template v-if="cabin_type_option.is_selected">
                                                <b-list-group-item
                                                        class="d-block w-100 p-0 cursor-pointer p-2"
                                                        @mouseover="selectedOnHover(cabin,cabin_type_option_index)"
                                                        @mouseleave="selectedOnLeave(cabin,cabin_type_option_index)"
                                                        @click="unSelectCabinType(cabin,cabin_type_option_index)"
                                                >
                                                    <b-row class="m-0" align-v="center">
                                                        <b-col cols="1" class="text-center p-0 align-middle">
                                                            <i :class="cabin_type_option.icon_class"></i>
                                                        </b-col>
                                                        <b-col class="p-0">
                                                            <h6 class="m-0">
                                                                {{cabin_type_option.description}}
                                                                <!--<i class="fa fa-fw fa-question-circle float-right" v-b-tooltip.hover :title="cabin_type_option.text"></i>-->

                                                                <i class="fa fa-fw fa-question-circle float-right" :id="'popover-id-'+index+'-'+cabin_type_option_index"></i>
                                                                <b-popover :target="'popover-id-'+index+'-'+cabin_type_option_index" triggers="hover" placement="top">
                                                                    <template v-slot:title>{{cabin_type_option.description}}</template>
                                                                    <p class="text-justify">
                                                                        {{cabin_type_option.text}}
                                                                    </p>
                                                                </b-popover>
                                                            </h6>
                                                        </b-col>
                                                    </b-row>
                                                    <b-row class="m-0" >
                                                        <b-col offset="1" class="p-0">
                                                            <h6 class="d-block mb-0">
                                                                <strong class="text-danger">&euro; {{Number(cabin_type_option.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                                                                <div class="small d-inline ml-2 text-line-through" v-if="JSON.parse(booking_details.itinerary.early_bird_validity)">&euro; {{Number(cabin_type_option.original_price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</div>
                                                            </h6>
                                                        </b-col>
                                                    </b-row>


                                                    <!--<div class="w-100 d-flex align-items-center">-->
                                                        <!--<div class="mr-auto">-->
                                                            <!--<i :class="cabin_type_option.icon_class"></i>-->
                                                            <!--<span>{{cabin_type_option.description}}</span>-->
                                                        <!--</div>-->
                                                        <!--<div class="">-->
                                                            <!--<i class="fa fa-fw fa-question-circle float-right" v-b-tooltip.hover :title="cabin_type_option.text"></i>-->
                                                        <!--</div>-->
                                                    <!--</div>-->
                                                    <!--<strong class="d-block text-danger">-->
                                                        <!--&euro; {{Number(cabin_type_option.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}-->
                                                    <!--</strong>-->
                                                </b-list-group-item>
                                            </template>

                                            <template v-else>
                                                <b-list-group-item
                                                        @click="selectCabinType(cabin,cabin_type_option_index)"
                                                        class="d-block w-100 p-0 cursor-pointer p-2"
                                                >
                                                    <b-row class="m-0" align-v="center">
                                                        <b-col cols="1" class="text-center p-0 align-middle">
                                                            <i class="fa fa-fw fa-circle-o h5 m-0"></i>
                                                        </b-col>
                                                        <b-col class="p-0">
                                                            <h6 class="m-0">
                                                                {{cabin_type_option.description}}
                                                                <!--<i class="fa fa-fw fa-question-circle float-right" v-b-tooltip.hover :title="cabin_type_option.text"></i>-->

                                                                <i class="fa fa-fw fa-question-circle float-right" :id="'popover-id-'+index+'-'+cabin_type_option_index"></i>
                                                                <b-popover :target="'popover-id-'+index+'-'+cabin_type_option_index" triggers="hover" placement="top">
                                                                    <template v-slot:title>{{cabin_type_option.description}}</template>
                                                                    <p class="text-justify">
                                                                        {{cabin_type_option.text}}
                                                                    </p>
                                                                </b-popover>
                                                            </h6>
                                                        </b-col>
                                                    </b-row>
                                                    <b-row class="m-0" >
                                                        <b-col offset="1" class="p-0">
                                                            <h6 class="d-block mb-0">
                                                                <strong class="text-danger">&euro; {{Number(cabin_type_option.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                                                                <div class="small d-inline ml-2 text-line-through" v-if="JSON.parse(booking_details.itinerary.early_bird_validity)">&euro; {{Number(cabin_type_option.original_price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</div>
                                                            </h6>
                                                        </b-col>
                                                    </b-row>


                                                    <!--<div class="w-100 d-flex align-items-center">-->
                                                        <!--<div class="mr-auto">-->
                                                            <!--<i class="fa fa-fw fa-circle-o h4"></i>-->
                                                            <!--<span>{{cabin_type_option.description}}</span>-->
                                                        <!--</div>-->
                                                        <!--<div class="">-->
                                                            <!--<i class="fa fa-fw fa-question-circle float-right" v-b-tooltip.hover :title="cabin_type_option.text"></i>-->
                                                        <!--</div>-->
                                                    <!--</div>-->
                                                    <!--<strong class="d-block text-danger">-->
                                                        <!--&euro; {{Number(cabin_type_option.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}-->
                                                    <!--</strong>-->
                                                </b-list-group-item>
                                            </template>
                                        </template>
                                    </template>
                                </b-list-group>
                            </b-col>
                        </b-row>


                    </div>
                </b-col>
            </b-row>



            <div class="text-center w-100 p-2" v-if="booking_details.number_of_guest_to_select<=0">
                <b-button
                        variant="success"
                        class="btn-block"
                        size="sm"
                        @click="closeCabinSelectionModal"
                >
                    <h5 class="m-0"><i class="fa fa-check-circle text-white"></i> DONE</h5>
                </b-button>
            </div>
            
        </b-modal>

        <!-- Modal Component -->
        <b-modal header-text-variant="light"
                  header-bg-variant="primary"
                  v-model="confirmation_modal"
                  size="md"
                  body-class="p-0"
                  no-close-on-backdrop no-close-on-esc
                  hide-footer
                  centered
                  @close="closeConfirmationModal">
            <template slot="modal-title">
                <div>
                    <h5 class="text-uppercase mb-0"><i class='fa fa-fw fa-file-text'></i>Select Payment Terms</h5>
                </div>
            </template>
                <b-row v-if="booking_details.itinerary.hasOwnProperty('itinerary_boat')">
                  <b-col>
                      <b-row class="m-0 px-2 py-2">
                          <b-col md="6" class="p-0 pr-sm-1 pr-0 pb-md-0 pb-2">
                              <div class="w-100 cursor-pointer rounded border border-socondary py-3 px-1 payment-terms"
                                   :class="{ 'selected-payment-terms' : booking_details.payment_terms==1}"
                                   @click="selectPaymentTerms(1)"
                                    id="full-payment">
                                  <h5 class="mb-0 font-weight-bold text-uppercase text-center">
                                      <i class="h4 mb-0 fa fa-fw fa-check-circle"></i>
                                      Full Payment
                                  </h5>
                              </div>
                              <b-popover target="full-payment" triggers="hover" placement="top">
                                  <template v-slot:title>FULL PAYMENT</template>
                                  <p class="text-justify">
                                      Select this option if you wish to pay for your booking in full.
                                  </p>
                              </b-popover>
                          </b-col>
                          <b-col md="6" class="p-0 pl-sm-1 pl-0">
                              <div class="w-100 cursor-pointer rounded border border-socondary py-3 px-1 payment-terms"
                                   :class="{ 'selected-payment-terms' : booking_details.payment_terms==2}"
                                   @click="selectPaymentTerms(2)"
                                    id="deposit">
                                  <h5 class="mb-0 font-weight-bold text-uppercase text-center">
                                      <i class="h4 mb-0 fa fa-fw fa-check-circle"></i>
                                      Deposit
                                  </h5>
                              </div>
                              <b-popover target="deposit" triggers="hover" placement="top">
                                  <template v-slot:title>DEPOSIT</template>
                                  <p class="text-justify">
                                      Select this option if you wish to pay a deposit and settle your balance later. (twelve weeks prior to your departure date)
                                  </p>
                              </b-popover>
                          </b-col>
                      </b-row>
                      <b-row class="m-0 d-flex align-items-center bg-success mb-3">
                        <b-col class="p-3">
                            <strong>
                                TOTAL AMOUNT DUE
                            </strong>
                        </b-col>
                        <b-col class="p-3 text-right">
                            <h1>
                                <strong v-if="booking_details.payment_terms==2">&euro; {{booking_details.deposit_amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                                <strong v-else>&euro; {{total_amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                            </h1>
                        </b-col>
                      </b-row>
                      <div class="alert alert-primary m-3 p-3" role="alert">
                        <b-form-checkbox
                            v-model="confirmation_terms"
                            >
                            <p class="cursor-pointer text-justify">
                            I HAVE REVIEWED MY BOOKING SUMMARY. <br>
                            The price and trip details are correct. I have read and accept the <strong>Terms and Conditions</strong> including the Cancellation/Refund Policy, Check-In Guidelines, Inclusions, Exclusions, Website Terms of Use, Data Privacy Act, and important reminders and information posted by Med Sailing Holidays. I hereby confirm that specific authority was given to me by all other guests traveling as part of this booking to consent, agree, and accept these conditions.
                            </p>
                        </b-form-checkbox>
                      </div>
                      <div class="m-3" v-if="booking_details.payment_terms!=-1 && confirmation_terms">
                        <button @click="proceed" type="button" class="p-3 btn btn-primary btn-sm btn-block">
                            <strong>PROCEED <i class="fa fa-angle-double-right"></i>
                            </strong>
                        </button>
                      </div>


                  </b-col>
                </b-row>
        </b-modal>

    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js'
    import Guests from './Guests.vue';
    import TermsAndConditions from './TermsAndConditions.vue';
    import { Callout } from '@coreui/vue'
    import BCol from "bootstrap-vue/src/components/layout/col";
    export default {
        mixins:[SwalMixin],
        components: {BCol, Guests,Callout,TermsAndConditions},
        props:{
            booking_details: {
                type: Object,
                default: () => {}
            },
            other_data: {
                type: Object,
                default: () => {}
            },
            total_amount_due: {
                type: Number,
                default: 0
            }
        },
        data() {
            return {
                number_of_guest:0,
                cabin_selection_modal:true,
                confirmation_terms:false,
                confirmation_modal:false,
            }
        },
        watch:{
        },
        created(){
        },
        mounted(){
            this.number_of_guest = this.booking_details.number_of_guest_to_select;
        },
        methods:{
            validateInputs(){
                
                if(this.booking_details.number_of_guest_to_select>0){
                    this.$emit('changeLoadStatus',false);
                    this.swal_transaction_error_data.text="Please complete your cabin selection.";
                    this.swalRequestError();
                }else{
                    this.confirmation_modal=true
                }
            },
            proceed(){
                this.$emit('nextStep');
            },
            selectCabinType(cabin,cabin_type_option_index){
                if(!cabin.cabin_type_options[cabin_type_option_index].is_selected){
                    cabin.cabin_type_options.forEach((data,index) => {
                        data.is_selected=false;
                    });
                    cabin.cabin_type_options[cabin_type_option_index].is_selected=true;
                    cabin.user_selection.cabin_type = cabin.cabin_type_options[cabin_type_option_index].cabin_type;
                    cabin.user_selection.occupancy = cabin.cabin_type_options[cabin_type_option_index].occupancy;
                    cabin.user_selection.price = cabin.cabin_type_options[cabin_type_option_index].price;

                    this.booking_details.number_of_guest_to_select -= cabin.cabin_type_options[cabin_type_option_index].slot_to_deduct;
                }
               
                // if(cabin.user_selection.cabin_type!=-1){
                //     this.number_of_guest+=cabin.user_selection.occupancy;
                // }
                
                // if(cabin.user_selection.cabin_type==-1 && this.number_of_guest<=0){
                //     this.swalRequestError();
                // }else{

                //     cabin.user_selection.cabin_type=cabin_type;
                //     cabin.user_selection.occupancy=occupancy;
                //     cabin.user_selection.price=price;

                //     this.number_of_guest -= occupancy;
                // }
                
            },
            unSelectCabinType(cabin,cabin_type_option_index){
                cabin.cabin_type_options.forEach((data,index) => {
                    data.is_selected=false;
                });
                cabin.user_selection.cabin_type = -1;
                cabin.user_selection.price = 0;
                cabin.user_selection.occupancy -= cabin.cabin_type_options[cabin_type_option_index].occupancy;
                this.booking_details.number_of_guest_to_select += cabin.cabin_type_options[cabin_type_option_index].slot_to_deduct;
            },
            selectedOnHover(cabin,cabin_type_option_index){
                cabin.cabin_type_options[cabin_type_option_index].icon_class = "fa fa-fw fa-times-circle h5 text-danger m-0"
            },
            selectedOnLeave(cabin,cabin_type_option_index){
                cabin.cabin_type_options[cabin_type_option_index].icon_class = "fa fa-fw fa-check-circle h5 text-success m-0"
            },
            selectPaymentTerms(payment_terms){
                this.booking_details.payment_terms=payment_terms;
                if(payment_terms==2)
                {
                    this.booking_details.deposit_amount_due = this.booking_details.guests.length * this.booking_details.itinerary.deposit_per_person;
                }else{
                    this.booking_details.deposit_amount_due = 0;
                }
            },
            closeConfirmationModal(){
                this.$emit('changeLoadStatus',false);
            },
            closeCabinSelectionModal(){
                this.cabin_selection_modal=false;
                this.$emit('changeLoadStatus',false);
            },
            checkIfNumber(cabin){
                if((isNaN(cabin.qty) && cabin.qty!='') || (cabin.qty<=0 && cabin.qty!='') || cabin.qty>cabin.remaining_balance)
                    cabin.qty=1;
            }
        }
    }
</script>

<style scoped>
.price-description{
    font-size:11px;
    font-weight: bold;
}
.slot-availability{
    font-size:11px;
}

</style>
