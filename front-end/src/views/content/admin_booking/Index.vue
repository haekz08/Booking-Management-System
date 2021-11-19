<template>
  <div class="animated fadeIn">
    <b-row class="m-0">
      <b-col class="p-0" cols="3">
          <div class="shadow m-0 bg-white">
              <b-row class="bg-primary border border-secondary m-0">
                  <b-col class="p-2">
                      <strong>
                          BOOKING SUMMARY
                      </strong>
                  </b-col>
              </b-row>
              <template v-if="typeof booking_details.itinerary.itinerary_boat !== 'undefined'">
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
          <div class="shadow ml-0 mt-3 bg-white">
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
          <b-button variant="primary" block class="my-3" @click="add_ons_modal=true">Manage your Add Ons</b-button>

          <b-button variant="warning" block class="my-3" @click="book()">Submit Booking</b-button>
      </b-col>
      <b-col class="p-3 ml-3 bg-white">
        <template v-for="(guest, index) in guests">
          <b-row class="bg-primary border border-secondary m-0">
              <b-col class="p-3">
                  Information Details
              </b-col>
          </b-row>
          <b-row class="border border-top-0 border-secondary m-0 mb-3">
              <b-col class="p-3">
                  <div class="alert alert-primary mb-3" role="alert" v-if="index!==0 && guests[0].id!='-1'">
                      <i class='fa fa-info-circle'></i> Click to choose from <strong><a @click.prevent="guestListClicked(index)" href="#" class="text-dark">guest list</a></strong>.
                      <a @click.prevent="resetGuest(index)" href="#" v-if="guest.id!==-1"><strong class="float-right">Reset</strong></a>
                  </div>
                  <div class="alert alert-primary mb-3" role="alert" v-if="index===0">
                      <i class='fa fa-info-circle'></i> Click to choose from returning <strong><a @click.prevent="guest_list_modal=true" href="#" class="text-dark">guest</a></strong>.
                      <a @click.prevent="resetGuest(index)" href="#" v-if="guest.id!==-1"><strong class="float-right">Reset</strong></a>
                  </div>
                  <b-row class="m-0">
                      <b-col md="2" class="pl-0 pr-0">
                          <div class="form-group">
                              <span class="text-muted">Salutation</span>
                              <select class="form-control mt-1" v-model="guest.guest_title_id" :disabled="(guest.id!=-1)">
                                  <option value="">Title</option>
                                  <option v-for="guest_title in guest_titles" :value="guest_title.id">{{guest_title.description}}</option>
                              </select>
                          </div>
                      </b-col>
                      <b-col md="4" class="pl-2 pr-0">
                          <div class="form-group">
                              <span class="text-muted">First Name</span>
                              <input v-model="guest.first_name" type="text" class="form-control mt-1" placeholder="First Name" :disabled="(guest.id!=-1)">
                          </div>
                      </b-col>
                      <b-col md="6" class="pl-2 pr-0">
                          <div class="form-group">
                              <span class="text-muted">Last Name</span>
                              <input v-model="guest.last_name" type="text" class="form-control mt-1"  placeholder="Surname" :disabled="(guest.id!=-1)">
                          </div>
                      </b-col>
                  </b-row>
                  <b-row class="m-0">
                      <b-col md="6" class="pl-0 pr-0">
                          <div class="form-group">
                              <span class="text-muted">Country Code</span>
                              <select v-model="guest.country_code_id" class="form-control mt-1" :disabled="(guest.id!=-1)">
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
                      <b-col md="6" class="pl-2 pr-0">
                          <div class="form-group">
                              <span class="text-muted">Phone Number</span>
                              <input v-model="guest.phone_number" type="text" class="form-control mt-1" :disabled="(guest.id!=-1)">
                          </div>
                      </b-col>
                  </b-row>
                  <b-row class="m-0" v-if="index==0">
                      <b-col md="12" class="p-0 m-0">
                          <b-row class="bg-primary border border-secondary m-0">
                              <b-col class="p-2">
                                  Your personal <strong>Med Sailing Holidays</strong> account
                              </b-col>
                          </b-row>
                          <b-row class="border border-top-0 border-secondary m-0">
                              <b-col class="p-3">
                                  <div class="form-group">
                                      <strong class="text-muted">Email</strong>
                                      <input v-model="guest.email" type="email" class="form-control mt-1" :disabled="(guest.id!=-1)">
                                  </div>
                              </b-col>
                          </b-row>
                      </b-col>
                  </b-row>
                  <b-row class="m-0 mt-3">
                      <b-col md="12" class="p-0 m-0">
                          <b-row class="bg-secondary border border-secondary m-0">
                              <b-col class="p-2">
                                  Cabin Selection
                              </b-col>
                          </b-row>
                          <b-row class="border border-top-0 border-secondary m-0">
                              <b-col class="p-3" cols="3">
                                  <div class="form-group">
                                      <span class="text-muted">Cabin</span>
                                      <select v-model="guest.cabin" class="form-control mt-1">
                                          <option :value={}>Select</option>
                                          <option v-for="cabin in booking_details.itinerary.itinerary_cabins_for_booking" :value="cabin">{{cabin.cabin_description.cabin_type.name}} - ({{cabin.cabin_description.code}})</option>
                                      </select>
                                  </div>
                                  <div class="form-group">
                                      <span class="text-muted">Occupancy</span>
                                      <select v-model="guest.cabin_occupancy" class="form-control mt-1" :disabled="(Object.keys(guest.cabin).length === 0)">
                                          <option value="">Select</option>
                                          <option value="1">Single Occupancy (Shared Cabin)</option>
                                          <template v-if="typeof guest.cabin.cabin_description !== 'undefined'">
                                            <option :value="guest.cabin.cabin_description.occupancy">Single Occupancy (Private Cabin)</option>
                                          </template>
                                      </select>
                                  </div>
                              </b-col>
                              <b-col class="p-3" cols="5">
                                    <div class="form-group">
                                        <span class="text-muted">Discount Description</span>
                                        <input v-model="guest.form.discount_description" type="text" class="form-control mt-1" placeholder="Description">
                                    </div>
                                    <b-row>
                                        <b-col>
                                            <div class="form-group">
                                                <span class="text-muted">Qty</span>
                                                <input v-model="guest.form.qty" type="number" step="any" class="form-control mt-1" placeholder="Qty">
                                            </div>
                                        </b-col>
                                        <b-col>
                                            <div class="form-group">
                                                <span class="text-muted">Amount</span>
                                                <input v-model="guest.form.amount" type="number" step="any" class="form-control mt-1" placeholder="Amount">
                                            </div>
                                        </b-col>
                                    </b-row>

                                    <b-button variant="primary" class="mb-3 float-right" @click="addDiscount(index)">Add Discount</b-button>

                                    <table class="table">
                                         <thead>
                                            <tr>
                                                <th scope="col">Description</th>
                                                <th scope="col">Total</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(discount, discount_index) in guest.discounts">
                                                <td>
                                                    <h5 class="mb-0">{{discount.discount_description}}</h5>
                                                    <small>{{discount.qty}}@&euro; {{discount.amount}}</small>
                                                </td>
                                                <td>
                                                    &euro; {{discount.amount*discount.qty}}
                                                </td>
                                                <td>
                                                    <a href="#" @click.prevent="removeDiscount(index,discount_index)">remove</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                              </b-col>
                              <b-col class="p-3">
                                    <ul class="list-group">
                                        <li class="list-group-item d-flex justify-content-between align-items-center h5">
                                            Cabin Price
                                            <span class="badge badge-primary badge-pill" v-if="guest.cabin_occupancy!=''">{{(guest.cabin_occupancy == 1) ? '&euro; '+guest.cabin.price_per_person : '&euro; '+guest.cabin.cabin_price}}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center h5">
                                            Total Discount
                                            <span class="badge badge-primary badge-pill">&euro; {{(isNaN(guest.total_discount) ? 0.00 : guest.total_discount.toLocaleString('en-US',{ minimumFractionDigits: 2 }))}}</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center active h5">
                                            Amount Due
                                            <span class="badge badge-danger badge-pill">&euro; {{guest.total_amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</span>
                                        </li>
                                    </ul>

                              </b-col>
                          </b-row>
                      </b-col>
                  </b-row>
              </b-col>
          </b-row>
        </template>
        <b-row class="bg-light border border-secondary m-0">
              <b-col class="py-3 text-center cursor-pointer" @click="addGuest()">
                  <i class='fa fa-plus-circle mb-0 text-secondary' style="font-size:64px"></i>
              </b-col>
          </b-row>
      </b-col>
    </b-row>
    <!-- Guest List Modal Component -->
    <b-modal
            header-bg-variant="primary" footer-bg-variant="primary" centered
            :hide-footer="true"
            v-model="guest_list_modal" body-class="p-0"
            no-close-on-backdrop no-close-on-esc>
        <template slot="modal-title">
            <div>
                <h5 class="mb-0"><i class='fa fa-user'></i>&nbsp;&nbsp;Select from your guest list.<span></span></h5>
            </div>
        </template>
        <div class="custom-modal-body">
            <div class="alert alert-primary mb-3" role="alert">
                <i class='fa fa-info-circle'></i> Click to select guest.
            </div>
            <div class="list-group">
                <button v-for="guest in current_guests" type="button" class="list-group-item list-group-item-action" @click="assignAsMainGuest(guest)">{{guest.full_name}}</button>
            </div>
        </div>
    </b-modal>

    <!-- Main Guest Guests List Modal Component -->
    <b-modal
            header-bg-variant="primary" footer-bg-variant="primary" centered
            :hide-footer="true"
            v-model="main_guest_list_modal" body-class="p-0"
            no-close-on-backdrop no-close-on-esc>
        <template slot="modal-title">
            <div>
                <h5 class="mb-0"><i class='fa fa-user'></i>&nbsp;&nbsp;Select from your guest list.<span></span></h5>
            </div>
        </template>
        <div class="custom-modal-body">
            <div class="alert alert-primary mb-3" role="alert">
                <i class='fa fa-info-circle'></i> Click to select guest.
            </div>
            <div class="list-group">
                <button v-for="guest in guests[0].guests_list" type="button" class="list-group-item list-group-item-action" @click="assignGuest(guest)">{{guest.full_name}}</button>
            </div>
        </div>
    </b-modal>

    <!-- Add Ons Modal Component -->
    <b-modal
            header-bg-variant="primary" footer-bg-variant="primary" centered
            :hide-footer="true"
            v-model="add_ons_modal" body-class="p-0"
            no-close-on-backdrop no-close-on-esc>
        <template slot="modal-title">
            <div>
                <h5 class="mb-0"><i class='fa fa-list-ul'></i>&nbsp;&nbsp;Select your add ons.<span></span></h5>
            </div>
        </template>
        <div class="custom-modal-body">
            <b-row class="m-0">
                <b-col md="6" class="m-0 p-1"  v-for="add_on in booking_details.itinerary.add_ons">
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
                            <b-form-input v-model="add_on.qty" type="text" :disabled="!add_on.is_selected"></b-form-input>
                        </b-input-group>
                    </div>
                </b-col>
            </b-row>
        </div>
    </b-modal>
  </div>
</template>


<script>
  import {bus} from '@/main.js';
  import SwalMixin from '@/views/mixins/Swal.js';

  export default {
    mixins: [SwalMixin],
    data() {
      return {
        loading:false,
        booking_details:{
          itinerary:{},
        },
        guests:[],
        guest_titles:[],
        nationalities:[],
        nationalities:[],
        guest_list_modal:false,
        main_guest_list_modal:false,
        add_ons_modal:false,
        current_guests:[],
        selected_guest:-1
      }
    },
    created(){
      this.get();
      this.addGuest();
    },
    watch: {
        guests:{
            deep: true,
            immediate: true,
            handler(){
                this.guests.forEach(guest=>{
                    let total_discount= guest.discounts.reduce((total, value)=>{
                        return total +(Number(value.amount) * Number(value.qty));
                    },0);
                    guest.total_discount=(total_discount<0 || isNaN(total_discount)) ? 0.00 : total_discount;
                    if(guest.cabin_occupancy!=''){
                        let cabin_price = (guest.cabin_occupancy == 1) ? guest.cabin.price_per_person : guest.cabin.cabin_price;
                        guest.total_amount_due=Number(cabin_price) - Number(guest.total_discount);
                    }
                });
            }
        }
    },
    computed: {
        total_amount_due(){
            //return 0;
            let due=(this.total_rooms_due + this.total_add_ons_due);
            if(due<0 || isNaN(due))
                return 0;
            return Number(due);
        },
        total_rooms_due(){
            return this.guests.reduce((total, value)=>{
                     return total + Number(value.total_amount_due);
                },0);
        },
        total_add_ons_due(){
            if(typeof this.booking_details.itinerary.add_ons == "undefined")
            return 0.00;

            return this.booking_details.itinerary.add_ons.reduce((total, value)=>{
                if(value.is_selected){
                    let add_ons_due = total +(Number(value.price) * Number(value.qty));
                    if(add_ons_due<0)
                        return 0;

                    return add_ons_due;
                }
                if(total<0 || isNaN(total))
                return 0;

                return total;
            },0);
        },
        total_discount(){
            let total_discount=0;
            this.guests.forEach(guest => {
                let result = guest.discounts.reduce((total, value)=>{
                    let discounts = total +(Number(value.amount) * Number(value.qty));
                    return discounts
                },0);
                total_discount+=result;
            });
            return total_discount;
        },
    },
    methods: {
      get(){
        this.loading = true;
        this.axios.get('itinerary/get', {
            params: {
                id: this.$route.params.itinerary_id
            }
        }).then(response => {
            this.booking_details.itinerary = response.data.itinerary;
            this.guest_titles = response.data.guest_titles;
            this.nationalities = response.data.nationalities;
            this.current_guests = response.data.guests;
            // this.loading = false;

        }).catch(error => console.log(error));
      },
      assignAsMainGuest(guest){
        //this.guests[0]=guest;
        this.guests[0].id=guest.id;
        this.guests[0].guest_title_id=guest.guest_title_id;
        this.guests[0].first_name=guest.first_name;
        this.guests[0].last_name=guest.last_name;
        this.guests[0].country_code_id=guest.country_code_id;
        this.guests[0].phone_number=guest.phone_number;
        this.guests[0].email=guest.email;
        this.guests[0].guests_list=guest.guests_list;
        this.guests[0].discounts=[];
        this.guests[0].total_amount_due=0;

        this.guests[0].form={
              discount_description:'',
              qty:'',
              amount:''
          };
        this.guest_list_modal=false;
      },
      assignGuest(guest){
        //this.booking_details.guests[this.selected_guest]=guest;
        this.guests[this.selected_guest].id=guest.id;
        this.guests[this.selected_guest].guest_title_id=guest.guest_title_id;
        this.guests[this.selected_guest].first_name=guest.first_name;
        this.guests[this.selected_guest].last_name=guest.last_name;
        this.guests[this.selected_guest].country_code_id=guest.country_code_id;
        this.guests[this.selected_guest].phone_number=guest.phone_number;
        this.guests[this.selected_guest].email=guest.email;
        this.guests[this.selected_guest].form={
              discount_description:'',
              qty:'',
              amount:''
          };

        this.guests[this.selected_guest].discounts=[];
        this.guests[this.selected_guest].total_amount_due=0;
        this.main_guest_list_modal=false;
      },
      resetGuest(index){
        if(index==0){
          this.guests=[];
          this.addGuest();
        }else{
          this.guests[index].id=-1
          this.guests[index].guest_title_id='';
          this.guests[index].first_name='';
          this.guests[index].last_name='';
          this.guests[index].country_code_id='';
          this.guests[index].phone_number='';
          this.guests[index].email='';
          this.guests[index].guests_list=[];
          this.guests[index].discounts=[];
          this.guests[index].cabin={};
          this.guests[index].form={
              discount_description:'',
              qty:'',
              amount:''
          };
          this.guests[index].discounts=[];
          this.guests[index].total_amount_due=0;
        }

      },
      addGuest(){
        let guest ={
              id:-1,
              guest_title_id:'',
              first_name: '',
              last_name: '',
              country_code_id: '',
              phone_number: '',
              email: '',
              guests_list:[],
              cabin:{},
              cabin_occupancy:'',
              form:{
                    discount_description:'',
                    qty:'',
                    amount:''
                },
              discounts:[],
              total_amount_due:0
            }
        this.guests.push(guest);
      },
      guestListClicked(index){
        this.selected_guest=index;
        this.main_guest_list_modal=true
      },
      addDiscount(index){
          let form = JSON.parse(JSON.stringify(this.guests[index].form));
          this.guests[index].discounts.push(form);
      },
      removeDiscount(guest_index,discount_index){
        this.guests[guest_index].discounts.splice(discount_index,1);
      },
      book(){
        this.swalConfirmSubmit((data) => {
          if (data.value) {
            let form = {}
            form.itinerary_id = this.$route.params.itinerary_id;
            form.guests = this.guests;
            form.grand_total = this.total_amount_due;
            form.add_ons = this.booking_details.itinerary.add_ons;
            this.axios.post('booking/admin_booking',form).then(response => {
                this.swalTransactionCompleted();
                this.$router.push('/bookings');
            }).catch(error => {
                this.swalRequestError();
                this.loading=false;
            });
          }
        });


    },
    }
  }
</script>

<style>
</style>
