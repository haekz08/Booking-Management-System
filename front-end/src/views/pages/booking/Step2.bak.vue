<template>
    <div>
    <b-card no-body class="my-3">
        <b-card-header header-tag="header" class="p-2" role="tab">
            <b-button block href="#" v-b-toggle.accordion-1 variant="primary">Cabin Selection</b-button>
        </b-card-header>
        <b-collapse id="accordion-1" visible accordion="accordion-1" role="tabpanel">
            <b-card-body class="p-2">
                <div class="alert alert-primary m-0 mb-2 p-2" role="alert">
                    <table>
                        <tr>
                            <td>
                                <i class="fa fa-fw fa-info-circle h2 m-0"></i>
                            </td>
                            <td>
                                <span>
                                    For solo travelers, cabin selections are subject to change depending on the availability and arrangement to accommodate all guests on board the boat.
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
                <b-row class="m-0">
                    <b-col md="4">
                        <b-row class="bg-light border border-secondary">
                            <b-col class="p-2">
                                <strong>
                                    Guide to cabin selection
                                </strong>
                            </b-col>
                        </b-row>
                        <b-row class="border border-top-0 border-secondary">
                            <b-col class="p-2">
                                <h2 class="d-flex align-items-center mb-2"><i class="fa fa-fw fa-user text-muted"></i> <span class="h6 m-0 ml-2">FULLY OCCUPIED</span></h2>
                                <h2 class="d-flex align-items-center mb-2"><i class="fa fa-fw fa-square-o text-info"></i> <span class="h6 m-0 ml-2">AVAILABLE</span></h2>
                                <h2 class="d-flex align-items-center mb-2"><i class="fa fa-fw fa-check-square text-success"></i> <span class="h6 m-0 ml-2">SELECTED</span></h2>
                            </b-col>
                        </b-row>

                        <b-row class="bg-light border border-secondary mt-2">
                            <b-col class="p-2">
                                <strong>
                                    Room Summary
                                </strong>
                            </b-col>
                        </b-row>
                        <b-row class="border border-top-0 border-secondary">
                            <b-col class="p-2">
                                <b-list-group>
                                    <b-list-group-item @click="changeSelectedUser(index)" v-for="(guest, index) in booking_details.guests" class="cursor-pointer p-2 text-capitalize" :class="{ active: guest.is_selected }"><i class="fa fa-fw fa-user"></i> {{(guest.last_name.value!='') ? guest.last_name.value : 'Guest ' + (index+1)}}
                                        <i v-if="guest.cabin.id!=-1" class="fa fa-fw fa-check float-right" :class="{ 'text-white' : guest.is_selected, 'text-success' : !guest.is_selected}" v-b-tooltip.hover :title="guest.cabin.cabin_description.cabin_type.name + ' - ' +guest.cabin.cabin_description.code"></i>
                                        <i v-else class="fa fa-fw fa-exclamation-triangle float-right"  :class="{ 'text-white' : guest.is_selected, 'text-warning' : !guest.is_selected}" v-b-tooltip.hover title="Please select a cabin"></i>
                                    </b-list-group-item>
                                </b-list-group>
                            </b-col>
                        </b-row>
                    </b-col>
                    <b-col class="p-0 rounded border border-secondary bg-light ml-2 pt-2 pr-2">
                        <b-row class="m-0 p-0">
                            <b-col md="6" class="p-0" v-for="(cabin, index) in booking_details.itinerary.itinerary_cabins_for_booking">
                                <b-row class="m-0 pb-2 pl-2">
                                    <b-col class="m-0 p-0">
                                        <b-row class="m-0 bg-dark border border-dark rounded-top">
                                            <b-col class="p-2">
                                                <strong class="h6">
                                                    {{cabin.cabin_description.cabin_type.name}} - {{cabin.cabin_description.code}}
                                                </strong>
                                            </b-col>
                                        </b-row>
                                        <b-row class="m-0 border border-top-0 border-dark bg-white rounded-bottom">
                                            <b-col class="m-0 p-0">
                                                <b-row class="bg-light border border-secondary rounded p-2 m-2">
                                                    <b-col class="p-0 text-center">
                                                        <h2 class="mb-0">
                                                        <i class="fa fa-fw fa-square-o text-info cursor-pointer"

                                                            @click="selectCabin(index,cabin)"
                                                            @mouseover="availableOnHover"
                                                            @mouseleave="availableOnLeave"
                                                            v-if="cabin.slot_left>0 && selected_guest.cabin.id!=cabin.id && selected_guest.cabin.id==-1"
                                                        ></i>
                                                        <i class="fa fa-fw fa-square-o text-muted"
                                                            v-else-if="cabin.slot_left>0 && selected_guest.cabin.id!=cabin.id"
                                                        ></i>
                                                        <i class="fa fa-fw fa-check-square text-success"
                                                            v-else-if="selected_guest.cabin.id==cabin.id && selected_guest.occupancy == 1"
                                                            @mouseover="selectedOnHover"
                                                            @mouseleave="selectedOnLeave"
                                                            @click="unSelectCabin(index,cabin)"
                                                        ></i>
                                                        <i class="fa fa-fw fa-user text-muted" v-else-if="cabin.slot_left<=0"></i>
                                                        </h2>
                                                        <u class="slot-availability">
                                                            <template v-if="cabin.slot_left>1">
                                                                {{cabin.slot_left}} SLOTS LEFT
                                                            </template>
                                                            <template v-else-if="cabin.slot_left==0">
                                                                FULL
                                                            </template>
                                                            <template v-else-if="cabin.slot_left==1">
                                                                {{cabin.slot_left}} SLOT LEFT
                                                            </template>
                                                        </u>
                                                    </b-col>
                                                    <b-col class="p-0 text-center">
                                                        <h2 class="mb-0">
                                                            <i class="fa fa-fw fa-square-o text-info cursor-pointer"
                                                                @click="selectWholeCabin(index,cabin)"
                                                                @mouseover="availableOnHover"
                                                                @mouseleave="availableOnLeave"
                                                                v-if="cabin.slot_left>0 && selected_guest.cabin.id!=cabin.id && selected_guest.cabin.id==-1 && cabin.slot_left == cabin.cabin_description.occupancy"
                                                            ></i>
                                                            <i class="fa fa-fw fa-square-o text-muted"
                                                                v-else-if="cabin.slot_left>0 && selected_guest.cabin.id!=cabin.id"
                                                            ></i>
                                                            <i class="fa fa-fw fa-check-square text-success"
                                                                v-else-if="selected_guest.occupancy > 1 && selected_guest.cabin.id==cabin.id"
                                                                @mouseover="selectedOnHover"
                                                                @mouseleave="selectedOnLeave"
                                                                @click="unSelectWholeCabin(index,cabin)"
                                                            ></i>

                                                            <i class="fa fa-fw fa-user text-muted" v-else-if="cabin.slot_left<=0"></i>
                                                            <i class="fa fa-fw fa-square-o text-muted "
                                                            v-else
                                                            ></i>
                                                        </h2>
                                                        <u class="slot-availability">
                                                            <template v-if="cabin.slot_left == cabin.cabin_description.occupancy">
                                                                OCCUPY CABIN
                                                            </template>
                                                            <template v-else-if="selected_guest.occupancy > 1 && selected_guest.cabin.id==cabin.id">
                                                                OCCUPIED
                                                            </template>
                                                            <template v-else>
                                                                CABIN N/A
                                                            </template>
                                                        </u>
                                                    </b-col>
                                                </b-row>
                                                <template v-if="booking_details.promo_code.is_active">
                                                    <b-row class="mx-2 mb-2">
                                                        <b-col class="p-0 m-0 text-center">
                                                            <span class="d-block text-muted price-description">Price per Person</span>
                                                            <strong class="d-block text-danger">
                                                                &euro; {{Number(cabin.price_per_person-booking_details.promo_code.discount_amount).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                                            </strong>
                                                            <span class="d-block text-muted price-description font-weight-normal text-line-through">&euro; {{Number(cabin.price_per_person).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</span>
                                                        </b-col>
                                                        <b-col class="p-0 m-0 text-center">
                                                            <span class="d-block text-muted price-description">Cabin Price</span>
                                                            <strong class="d-block text-danger">
                                                                &euro; {{Number(cabin.cabin_price-booking_details.promo_code.discount_amount).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                                            </strong>
                                                            <span class="d-block text-muted price-description font-weight-normal text-line-through">&euro; {{Number(cabin.cabin_price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</span>
                                                        </b-col>
                                                    </b-row>
                                                </template>

                                                <template v-else>
                                                    <b-row class="mx-2 mb-2" v-if="!JSON.parse(booking_details.itinerary.early_bird_validity)">
                                                        <b-col class="p-0 m-0 text-center">
                                                            <span class="d-block text-muted price-description">Price per Person</span>
                                                            <strong class="d-block">
                                                                &euro; {{Number(cabin.price_pp).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                                            </strong>
                                                            <span class="d-block text-muted price-description font-weight-normal">Regular Price</span>
                                                        </b-col>
                                                        <b-col class="p-0 m-0 text-center">
                                                            <span class="d-block text-muted price-description">Cabin Price</span>
                                                            <strong class="d-block">
                                                                &euro; {{Number(cabin.price_cbn).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                                            </strong>
                                                            <span class="d-block text-muted price-description font-weight-normal">Regular Price</span>
                                                        </b-col>
                                                    </b-row>
                                                    <b-row class="mx-2 mb-2" v-else>
                                                        <b-col class="p-0 m-0 text-center">
                                                            <span class="d-block text-muted price-description">Price per Person</span>
                                                            <strong class="d-block text-danger">
                                                                &euro; {{Number(cabin.price_pp).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                                            </strong>
                                                            <span class="d-block text-muted price-description font-weight-normal text-line-through">&euro; {{Number(cabin.price_per_person).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</span>
                                                        </b-col>
                                                        <b-col class="p-0 m-0 text-center">
                                                            <span class="d-block text-muted price-description">Cabin Price</span>
                                                            <strong class="d-block text-danger">
                                                                &euro; {{Number(cabin.price_cbn).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                                            </strong>
                                                            <span class="d-block text-muted price-description font-weight-normal text-line-through">&euro; {{Number(cabin.cabin_price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</span>
                                                        </b-col>
                                                    </b-row>
                                                </template>
                                            </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                            </b-col>

                        </b-row>
                    </b-col>
                </b-row>
            </b-card-body>
        </b-collapse>
    </b-card>
    <b-card no-body class="my-3">
        <b-card-header header-tag="header" class="p-2" role="tab">
            <b-button block href="#" v-b-toggle.add-ons variant="primary">Add Ons</b-button>
        </b-card-header>
        <b-collapse id="add-ons" visible accordion="accordion-2" role="tabpanel">
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
                                            >
                                            {{add_on.description}}
                                        </b-form-checkbox>
                                    </strong>
                                </b-col>
                            </b-row>
                            <div class="bg-white p-2 shadow">
                                <h6 class="text-muted">PRICE : &euro; {{Number(add_on.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</h6>
                                <b-input-group size="sm" prepend="QTY :">
                                    <b-form-input v-model="add_on.qty" type="number" :disabled="!add_on.is_selected"></b-form-input>
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
        <b-collapse id="accordion-2" visible accordion="accordion-3" role="tabpanel">
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
        <b-collapse id="accordion-3" visible accordion="accordion-4" role="tabpanel">
            <b-card-body>
                <b-card-text>
                    <b-list-group>
                        <b-list-group-item v-for="exclusion in booking_details.itinerary.exclusions"><i class="fa fa-fw fa-close text-danger"></i> {{exclusion.description}}</b-list-group-item>
                    </b-list-group>
                </b-card-text>
            </b-card-body>
        </b-collapse>
    </b-card>
    <!-- Modal Component -->
        <b-modal header-text-variant="light"
                  header-bg-variant="primary"
                  v-model="confirmation_modal"
                  size="md"
                  body-class="p-0"
                  no-close-on-backdrop no-close-on-esc
                  hide-footer
                  @close="closeConfirmationModal">
            <template slot="modal-title">
                <div>
                    <h5><i class='fa fa-fw fa-file-text'></i>BOOKING SUMMARY</h5>

                </div>
            </template>
                <b-row v-if="booking_details.itinerary.hasOwnProperty('itinerary_boat')">
                  <b-col>
                      <b-row class="m-0 mt-3">
                        <b-col class="px-3 py-0 m-0">
                            <h6 class="text-primary mb-0">Itinerary Brand</h6>
                            <h4 class="mb-3 pb-0 font-weight-bold">
                              {{booking_details.itinerary.itinerary_brand.description}}
                              <span class="text-muted d-block h6">&nbsp;</span>
                            </h4>
                        </b-col>
                        <b-col class="px-3 py-0 m-0">
                          <h6 class="text-primary mb-0">Boat</h6>
                            <h4 class="mb-3 pb-0 font-weight-bold">
                              {{booking_details.itinerary.itinerary_boat.name}}
                              <span class="text-muted d-block h6">{{booking_details.itinerary.itinerary_boat.boat_type.name}}</span>
                            </h4>
                        </b-col>
                      </b-row>
                      <b-row class="m-0">
                        <b-col class="px-3 py-0 m-0">
                            <h6 class="text-primary mb-0">Check In</h6>
                            <h4 class="mb-3 pb-0 font-weight-bold">
                              {{booking_details.itinerary.itinerary_city_from.name}}
                              <span class="text-muted d-block h6 mb-0">{{booking_details.itinerary.port_from.name}}</span>
                              <span class="d-block h6 mb-0">{{booking_details.itinerary.check_in.other_formats.format_1}}</span>
                              <span class="d-block h6">{{booking_details.itinerary.check_in.other_formats.format_3}}</span>
                            </h4>
                        </b-col>
                        <b-col class="px-3 py-0 m-0">
                          <h6 class="text-primary mb-0">Check Out</h6>
                          <h4 class="mb-0 pb-0 font-weight-bold">
                            {{booking_details.itinerary.itinerary_city_to.name}}
                            <span class="text-muted d-block h6 mb-0">{{booking_details.itinerary.port_to.name}}</span>
                            <span class="d-block h6 mb-0">{{booking_details.itinerary.check_out.other_formats.format_1}}</span>
                            <span class="d-block h6">{{booking_details.itinerary.check_out.other_formats.format_3}}</span>
                          </h4>
                        </b-col>
                      </b-row>

                      <b-row class="bg-primary m-0">
                        <b-col class="p-3">
                            <strong class="text-uppercase">
                                Guest Details
                            </strong>
                        </b-col>
                      </b-row>
                      <b-row class="m-0 px-3 py-2">
                        <b-col class="p-0 my-1">
                            <guests
                                :guests="booking_details.guests"
                            />
                        </b-col>
                      </b-row>

                      <b-row class="bg-primary m-0">
                        <b-col class="p-3">
                            <strong class="text-uppercase">
                                Add Ons
                            </strong>
                        </b-col>
                      </b-row>
                      <b-row class="m-0 px-3 py-2">
                        <b-col v-for="add_on in booking_details.add_ons" v-if="add_on.is_selected" md="12" class="p-2 my-1 rounded border border-socondary">
                            <b-row class="d-flex align-items-center">
                              <b-col md="7">
                                <h6 class="mb-0 pb-0 font-weight-bold text-uppercase">
                                  ({{add_on.qty.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}){{add_on.description}}
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


                      <b-row class="bg-primary m-0">
                        <b-col class="p-3">
                            <strong class="text-uppercase">
                                Inclusions
                            </strong>
                        </b-col>
                      </b-row>
                      <b-row class="m-0 px-3 py-2">
                        <b-col v-for="inclusion in booking_details.itinerary.inclusions" md="12" class="p-2 my-1 rounded border border-socondary">
                            <b-row class="d-flex align-items-center">
                              <b-col>
                                <h6 class="mb-0 pb-0 font-weight-bold">
                                  <i class="fa fa-fw fa-check text-success"></i> {{inclusion.description}}
                                </h6>
                              </b-col>
                            </b-row>
                        </b-col>
                      </b-row>


                      <b-row class="bg-primary m-0">
                        <b-col class="p-3">
                            <strong class="text-uppercase">
                                Exclusions
                            </strong>
                        </b-col>
                      </b-row>
                      <b-row class="m-0 px-3 py-2">
                        <b-col v-for="exclusion in booking_details.itinerary.exclusions" md="12" class="p-2 my-1 rounded border border-socondary">
                            <b-row class="d-flex align-items-center">
                              <b-col>
                                <h6 class="mb-0 pb-0 font-weight-bold">
                                  <i class="fa fa-fw fa-close text-danger"></i> {{exclusion.description}}
                                </h6>
                              </b-col>
                            </b-row>
                        </b-col>
                      </b-row>

                      <b-row class="bg-primary m-0">
                        <b-col class="p-3">
                            <strong class="text-uppercase">
                                Select Payment Terms
                            </strong>
                        </b-col>
                      </b-row>
                      <b-row class="m-0 px-3 py-2">
                        <b-col md="6" class="m-0 p-0">
                            <b-row class="cursor-pointer payment-terms d-flex align-items-center p-2 my-1 mr-2 ml-0 rounded border border-socondary"
                            :class="{ 'selected-payment-terms' : booking_details.payment_terms==1}"
                            @click="selectPaymentTerms(1)">
                              <b-col md="2" class="text-center m-0 p-0">
                                <i class="h4 mb-0 fa fa-fw fa-check-circle align-middle"></i>
                              </b-col>
                              <b-col class="p-0">
                                <h5 class="mb-0 pb-0 font-weight-bold text-uppercase">
                                  Full Payment
                                </h5>
                                <h6 class="mb-0">Payment Description</h6>
                              </b-col>
                            </b-row>
                        </b-col>

                        <b-col md="6" class="m-0 p-0">
                            <b-row class="cursor-pointer payment-terms d-flex align-items-center p-2 my-1 ml-2 mr-0 rounded border border-socondary"
                                  :class="{ 'selected-payment-terms' : booking_details.payment_terms==2}"
                                  @click="selectPaymentTerms(2)">
                              <b-col md="2" class="text-center m-0 p-0">
                                <i class="h4 mb-0 fa fa-fw fa-check-circle align-middle"></i>
                              </b-col>
                              <b-col class="p-0">
                                <h5 class="mb-0 pb-0 font-weight-bold text-uppercase">
                                  Deposit
                                </h5>
                                <h6 class="mb-0">Payment Description</h6>
                              </b-col>
                            </b-row>
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
                            <span class="cursor-pointer">
                            I confirm that I have read, understood and agree to the Company Privacy Policy which provides additional information on how my Personal Information is used.
                            </span>
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
    export default {
        mixins:[SwalMixin],
        components: {Guests},
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
                selected_guest:{
                    cabin:{
                        id:-1
                    }
                },
                confirmation_terms:false,
                confirmation_modal:false,
            }
        },
        created(){
        },
        mounted(){
            this.booking_details.guests.forEach((val)=>{
                if(val.is_selected==true){
                    this.selected_guest = val;
                }
            });
            this.$emit('changeLoadStatus',false);
        },
        methods:{
            validateInputs(){
                let error=0;
                this.booking_details.guests.forEach((data,index) => {
                    data.cabin.id==-1 ? error++ : '';
                });
                if(error==0){
                    this.confirmation_modal=true
                }else{
                    this.$emit('changeLoadStatus',false);
                    this.swal_transaction_error_data.text="Please select a cabin to every guest.";
                    this.swalRequestError();
                }
            },
            proceed(){
                this.$emit('nextStep');
            },
            changeSelectedUser(index){
                this.booking_details.guests.forEach((val)=>{
                    val.is_selected = false;
                });
                this.booking_details.guests[index].is_selected=true;
                this.selected_guest = this.booking_details.guests[index];
            },
            addDiscounts(cabin,original_price,eb_price){
                let discounts = [];
                this.selected_guest.cabin = JSON.parse(JSON.stringify(cabin));
                if(this.booking_details.promo_code.is_active){
                    let data = {}
                    let discount_amount = this.booking_details.promo_code.discount_amount;
                    data.discount_description = 'Ambassador Promo Code - '+this.booking_details.promo_code.code;
                    data.qty = 1;
                    data.amount = discount_amount;
                    data.total = discount_amount;

                    discounts.push(data);
                }else{
                    if(JSON.parse(this.booking_details.itinerary.early_bird_validity))
                    {
                        let data = {}
                        let ebd = original_price - eb_price;
                        data.discount_description = 'Early Bird Promo';
                        data.qty = 1;
                        data.amount = ebd;
                        data.total = ebd;

                        discounts.push(data);
                    }
                }
                if(this.selected_guest.main_guest && JSON.parse(this.booking_details.itinerary.is_referral_active) && this.booking_details.number_of_guest.value>1){
                    let data = {}
                    let amount = this.booking_details.itinerary.referral_price;
                    let qty = this.booking_details.number_of_guest.value - 1;
                    data.qty = qty;
                    data.discount_description = 'Bring a Friend Promo ('+qty+' friend/s)';

                    data.amount = amount;
                    data.total = amount * qty;
                    discounts.push(data);
                }
                this.selected_guest.discounts = discounts;
                let total_discount = discounts.reduce((total, value)=>{
                    return total + Number(value.total);
                },0);
                console.log(total_discount);
                return total_discount;
            },
            resetSelectedGuest(){
                let default_cabin = {};
                default_cabin.id=-1
                this.selected_guest.cabin = default_cabin;
                this.selected_guest.amount_due = 0;
                this.selected_guest.original_amount_due = 0;
                this.selected_guest.discounts = [];
            },
            selectCabin(index,cabin){
                this.booking_details.itinerary.itinerary_cabins_for_booking[index].slot_left--;
                this.selected_guest.occupancy = 1;

                let total_discount = this.addDiscounts(cabin,cabin.price_per_person,cabin.price_pp);
                let amount_due = cabin.price_per_person - total_discount;

                this.selected_guest.original_amount_due = cabin.price_per_person;
                this.selected_guest.amount_due = amount_due;
            },
            unSelectCabin(index,cabin){
                cabin.slot_left++;
                this.resetSelectedGuest();
            },
            selectWholeCabin(index,cabin){
                this.booking_details.itinerary.itinerary_cabins_for_booking[index].slot_left=0;
                this.selected_guest.occupancy = cabin.cabin_description.occupancy;

                let total_discount = this.addDiscounts(cabin,cabin.cabin_price,cabin.price_cbn);
                let amount_due = cabin.cabin_price - total_discount;

                this.selected_guest.original_amount_due = cabin.cabin_price;
                this.selected_guest.amount_due = amount_due;
            },
            unSelectWholeCabin(index,cabin){
                this.booking_details.itinerary.itinerary_cabins_for_booking[index].slot_left=this.selected_guest.occupancy;
                this.resetSelectedGuest();
            },
            availableOnHover(event){
                event.target.className = "fa fa-fw text-info cursor-pointer fa-check-square";
            },
            availableOnLeave(event){
                event.target.className = "fa fa-fw text-info cursor-pointer fa-square-o";
            },
            selectedOnHover(event){
                event.target.className = "fa fa-fw text-danger cursor-pointer fa-times-circle";
            },
            selectedOnLeave(event){
                event.target.className = "fa fa-fw text-success cursor-pointer fa-check-square";
            },
            selectAddOn(data){
                data.is_selected = !data.is_selected;
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
