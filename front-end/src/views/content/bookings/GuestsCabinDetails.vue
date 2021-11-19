<template>
<div class="animated fadeIn py-3">
    <b-row class="m-0">
        <b-col md="2">
            <b-list-group>
                <!-- <b-list-group-item v-if="user_details.role.id!=4" @click="selected_menu=1" :class="{ active: selected_menu==1 }" class="cursor-pointer p-2 text-capitalize"><i class="fa fa-fw fa-angle-double-right"></i>
                    Cabin Selection
                </b-list-group-item> -->
                <b-list-group-item @click="selected_menu=2" :class="{ active: selected_menu==2 }" class="cursor-pointer p-2 text-capitalize"><i class="fa fa-fw fa-angle-double-right"></i>
                    Add Ons
                </b-list-group-item>
            </b-list-group>
        </b-col>
        <b-col md="7" class="p-0 shadow bg-white border border-secondary" style="min-height:500px">
            <template class="animated fadeIn" v-if="selected_menu==2">
                <b-row class="bg-primary border-bottom border-secondary m-0">
                    <b-col class="p-2">
                        <strong>
                            Manage your add ons
                        </strong>
                    </b-col>
                </b-row>
                <b-row class="m-0">
                    <b-col class="p-3">
                        <b-row class="m-0">
                            <b-col md="4" class="m-0 p-1"  v-for="add_on in guest_add_ons">
                                <b-row class="bg-warning border border-secondary m-0">
                                    <b-col class="p-2">
                                        <strong>
                                            <b-form-checkbox
                                                :disabled="add_on.is_selected && add_on.qty!=0"
                                                v-model="add_on.is_selected"
                                                :value=true
                                                :unchecked-value=false
                                                >
                                                {{add_on.add_on.description}}
                                            </b-form-checkbox>
                                        </strong>
                                    </b-col>
                                </b-row>
                                <div class="bg-white p-2 shadow">
                                    <h6 class="text-muted">PRICE : &euro; {{Number(add_on.price).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</h6>
                                    <h6 class="text-muted" v-if="add_on.remaining_balance>0">AVAILABLE QTY : {{add_on.balance_left}}</h6>
                                    <b-input-group size="sm" prepend="QTY :">
                                        <b-form-input  v-model="add_on.qty" :disabled="!add_on.is_selected || add_on.is_selected"></b-form-input>
                                        <b-input-group-append v-if="add_on.is_selected">
                                            <b-button variant="danger" @click="add_on.qty--" :disabled="add_on.original_qty>=add_on.qty"><i class="fa fa-fw fa-minus"></i></b-button>
                                            <b-button variant="success" @click="add_on.qty++" :disabled="add_on.balance_left + add_on.original_qty <= add_on.qty"><i class="fa fa-fw fa-plus"></i></b-button>
                                        </b-input-group-append>
                                    </b-input-group>
                                </div>
                            </b-col>
                        </b-row>
                    </b-col>
                </b-row>
            </template>
        </b-col>
        <b-col md="3">
            <div class="shadow ml-2 bg-white">
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
            <div class="ml-2 mt-3">
                <b-button @click="validateInputs" block size="sm" variant="success">Submit</b-button>
            </div>
        </b-col>
    </b-row>
</div>
</template>

<script>
    import {bus} from '@/main.js'
    import SwalMixin from '@/views/mixins/Swal.js'
    export default {
        name: 'guests-cabin-details',
        inheritAttrs: false,
        mixins:[SwalMixin],
        props: {
            guests: {
                type: [Array, Object],
                default: () => []
            },
            add_ons: {
                type: [Array, Object],
                default: () => []
            },
            itinerary_details: {
                type: [Array, Object],
                default: () => []
            },
            active_invoice: {
                type: [Array, Object],
                default: () => []
            },
            total_payment: {
                type: [Array, Object],
                default: () => []
            },
            booking_id:{
                type: Number,
                default: -1,
                required:true
            },
            selected_menu:{
                type: Number,
                default: 2,
                required:true
            }
        },
        computed: {
            total_amount_due(){
                //return this.total_rooms_due + this.total_add_ons_due;
                let amount_due_now = this.total_add_ons_due + this.total_rooms_due;
                let amount_due_prev = this.active_invoice.grand_total.default;
                //return amount;
                let amount_due_final = amount_due_now - this.total_payment.default;

                return amount_due_final;
            },
            total_rooms_due(){
                return this.guests_details.reduce((total, value)=>{
                    return total + Number(value.amount_due);
                },0);
            },
            total_add_ons_due(){
                return this.guest_add_ons.reduce((total, value)=>{
                    if(value.is_selected)
                    return total +(Number(value.price) * Number(value.qty));

                    return total;
                },0);
            },
            user_details(){
              return this.$store.getters.userDetails;
            }
        },
        data(){
            return {
                guests_details:[],
                guest_add_ons:[],
                selected_guest:{},
                payment_type:1
            }
        },
        methods: {
            setUpData(){
                let temp_guests = JSON.parse(JSON.stringify(this.guests));
                let itinerary_cabins = JSON.parse(JSON.stringify(this.itinerary_details.itinerary_cabins_for_booking));
                let x = 1;
                temp_guests.forEach((guest)=>{
                    let cabin={};

                    itinerary_cabins.forEach((itinerary_cabin)=>{
                        if(itinerary_cabin.id==guest.itinerary_cabin_id){
                            cabin = itinerary_cabin;
                        }
                    });
                    
                    guest.cabin=cabin;
                    guest.occupancy=guest.occupancy;
                    guest.amount_due=guest.total_amount_due;

                    if(x==1){
                        guest.is_selected=true;
                        guest.default=true;
                        this.selected_guest = guest;
                    }else{
                        guest.is_selected=false;
                        guest.default=false;
                    }
                    this.guests_details.push(guest);
                    x++;
                });
                //this.guest_add_ons=JSON.parse(JSON.stringify(this.add_ons));
                let itinerary_add_ons = JSON.parse(JSON.stringify(this.itinerary_details.add_ons));
                let guest_add_ons = JSON.parse(JSON.stringify(this.add_ons));

                itinerary_add_ons.forEach((itinerary_add_on)=>{
                    itinerary_add_on.is_selected = false;
                    itinerary_add_on.qty = 0;
                    itinerary_add_on.original_qty = 0;
                    guest_add_ons.forEach((guest_add_on)=>{
                        if(itinerary_add_on.add_on_id == guest_add_on.add_on_id){
                            itinerary_add_on.is_selected = true;
                            itinerary_add_on.qty = guest_add_on.qty;
                            itinerary_add_on.original_qty = guest_add_on.qty;
                        }
                    });
                    
                    this.guest_add_ons.push(itinerary_add_on);
                });
            },
            changeSelectedUser(index){
                this.guests_details.forEach((val)=>{
                    val.is_selected = false;
                });
                this.guests_details[index].is_selected=true;
                this.selected_guest = this.guests_details[index];
            },
            selectCabin(index,cabin){
                this.itinerary_details.itinerary_cabins_for_booking[index].slot_left--;
                //cabin.slot_left--;
                this.selected_guest.cabin = JSON.parse(JSON.stringify(cabin));
                this.selected_guest.amount_due = cabin.price_per_person;
            },
            unSelectCabin(index,cabin){
                cabin.slot_left++;
                let default_cabin = {};
                default_cabin.id=-1
                this.selected_guest.cabin = default_cabin;
                this.selected_guest.amount_due = 0;
            },
            selectWholeCabin(index,cabin){
                this.itinerary_details.itinerary_cabins_for_booking[index].slot_left=0;
                this.selected_guest.occupancy = cabin.cabin_description.occupancy;
                this.selected_guest.cabin = JSON.parse(JSON.stringify(cabin));
                this.selected_guest.amount_due = cabin.cabin_price;
            },
            unSelectWholeCabin(index,cabin){
                this.itinerary_details.itinerary_cabins_for_booking[index].slot_left=this.selected_guest.occupancy;
                let default_cabin = {};
                default_cabin.id=-1
                this.selected_guest.cabin = default_cabin;
                this.selected_guest.occupancy = 1;
                this.selected_guest.amount_due = 0;
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
            changePaymentType(payment_type){
                this.payment_type=payment_type;
            },
            validateInputs(){
                let error=0;
                this.guests_details.forEach((data,index) => {
                    data.cabin.id==-1 ? error++ : '';
                });
                console.log(error);
                if(error==0){
                    this.saveBooking();
                }else{
                    this.swal_transaction_error_data.text="Please select a cabin to every guest.";
                    this.swalRequestError();
                }
            },
            saveBooking(){
                let form_data = {
                    id:this.booking_id,
                    guests:this.guests_details,
                    add_ons:this.guest_add_ons,
                    payment_type:this.payment_type,
                    grand_total:this.total_amount_due
                };
                this.swalConfirmSubmit((data)=>{
                    if (data.value) {
                        this.axios.post('booking/update',form_data).then(response => {
                            // this.invoice_payment_modal=false;
                            // this.amount_paid.value=0;
                            // this.getBookingDetails(this.booking_id);
                            this.swal_transaction_completed_data.text="Booking successfully updated.";
                            this.swalTransactionCompleted();
                            this.$emit('update_booking');
                        }).catch(error => {
                            this.swalRequestError();
                            this.is_saving=false;
                        });
                    }
                });
            }
        },
        created(){
            this.setUpData();
        }
    }
</script>
