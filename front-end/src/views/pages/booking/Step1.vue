<template>
    <div>
        <b-tabs content-class="px-3 py-0" active-nav-item-class="guest-tabs-active" nav-class="guest-tabs">
            <b-tab v-for="(guest, index) in booking_details.guests" :title="(guest.last_name.value!='') ? guest.last_name.value : 'Guest ' + (index+1) ">
                <b-row class="bg-primary border border-secondary">
                    <b-col class="p-3">
                        Information Details
                    </b-col>
                </b-row>
                <b-row class="border border-top-0 border-secondary">
                    <b-col class="p-3">
                        <div class="alert alert-primary mb-3" role="alert" v-if="index!==0">
                            <i class='fa fa-info-circle'></i> Click to choose from your <strong><a @click.prevent="chooseFromGuestList(index)" href="#" class="text-dark">guest list</a></strong>.
                            <a @click.prevent="resetGuest(index)" href="#" v-if="guest.db_id!==-1"><strong class="float-right">Reset</strong></a>
                        </div>
                        <b-row class="m-0">
                            <b-col md="2" class="pl-0 pr-0">
                                <div class="form-group">
                                    <span class="text-muted">Salutation</span>
                                    <select class="form-control mt-1" v-model="guest.guest_title_id.value" v-bind:class="{ 'is-invalid': guest.guest_title_id.error }" :disabled="(guest.db_id!=-1)">
                                        <option value="">Title</option>
                                        <option v-for="guest_title in other_data.guest_titles" :value="guest_title.id">{{guest_title.description}}</option>
                                    </select>
                                </div>
                            </b-col>
                            <b-col md="4" class="pl-2 pr-0">
                                <div class="form-group">
                                    <span class="text-muted">First Name</span>
                                    <input v-model="guest.first_name.value" type="text" class="form-control mt-1" v-bind:class="{ 'is-invalid': guest.first_name.error }" placeholder="First Name" :disabled="(guest.db_id!=-1)">
                                </div>
                            </b-col>
                            <b-col md="6" class="pl-2 pr-0">
                                <div class="form-group">
                                    <span class="text-muted">Last Name</span>
                                    <input v-model="guest.last_name.value" type="text" class="form-control mt-1" v-bind:class="{ 'is-invalid': guest.last_name.error }" placeholder="Surname" :disabled="(guest.db_id!=-1)">
                                </div>
                            </b-col>
                        </b-row>
                        <b-row class="m-0">
                            <b-col md="6" class="pl-0 pr-0">
                                <div class="form-group">
                                    <span class="text-muted">Country Code</span>
                                    <select v-model="guest.country_code.value" class="form-control mt-1" v-bind:class="{ 'is-invalid': guest.country_code.error }" :disabled="(guest.db_id!=-1)">
                                        <option value="">Select</option>
                                        <optgroup label="Frequently used country codes">
                                            <template v-for="cc in other_data.nationalities">
                                                <option :value="cc.id" v-if="cc.is_preferred==1">{{cc.description}} - ({{cc.country_code}})</option>
                                            </template>
                                        </optgroup>
                                        <optgroup label="Other Country Codes">
                                            <template v-for="cc in other_data.nationalities">
                                                <option :value="cc.id" v-if="cc.is_preferred==0">{{cc.description}} - ({{cc.country_code}})</option>
                                            </template>
                                        </optgroup>
                                    </select>
                                </div>
                                <!-- <div class="form-group">
                                    <span class="text-muted">Country Code</span>
                                    <select class="form-control mt-1" v-model="guest.country_code.value" v-bind:class="{ 'is-invalid': guest.country_code.error }">
                                        <option value="">Code</option>
                                        <option v-for="cc in other_data.nationalities" :value="cc.id">{{cc.description}} - ({{cc.country_code}})</option>
                                    </select>
                                </div> -->
                            </b-col>
                            <b-col md="6" class="pl-2 pr-0">
                                <div class="form-group">
                                    <span class="text-muted">Phone Number</span>
                                    <input v-model="guest.phone_number.value" type="text" class="form-control mt-1" v-bind:class="{ 'is-invalid': guest.phone_number.error }" :disabled="(guest.db_id!=-1)">
                                </div>
                            </b-col>
                            <!--<b-col md="6" class="pl-2 pr-0">-->
                                <!--<div class="form-group">-->
                                    <!--<span class="text-muted">Email</span>-->
                                    <!--<input v-model="guest.email.value" type="email" class="form-control mt-1" v-bind:class="{ 'is-invalid': guest.email.error }">-->
                                <!--</div>-->
                            <!--</b-col>-->
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
                                            <!--<input v-model="guest.email.value" type="email" class="form-control mt-1">-->
                                            <input v-model="guest.email.value" type="email" class="form-control mt-1" v-bind:class="{ 'is-invalid': guest.email.error }" :disabled="(guest.db_id!=-1)">
                                        </div>
                                        <!-- <div class="form-group mb-0">
                                            <strong class="text-muted">Password</strong>
                                            <input v-model="booking_details.user.password.value" type="password" class="form-control mt-1" v-bind:class="{ 'is-invalid': booking_details.user.password.error }">
                                        </div> -->
                                    </b-col>
                                </b-row>
                            </b-col>
                        </b-row>
                    </b-col>
                </b-row>

            </b-tab>
        </b-tabs>
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
                    <button v-for="guest in guest_list" v-if="guest.user_id===null" @click="assignGuest(guest)" type="button" class="list-group-item list-group-item-action">{{guest.full_name}}</button>                
                </div>
            </div>
        </b-modal>
    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js';
    export default {
        mixins:[SwalMixin],
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
                confirmation_terms:false,
                confirmation_modal:false,
                guest_list_modal:false,
                guest_list:[],
                selected_guest_index:-1
            }
        },
        computed: {
            loggedIn(){
                return this.$store.getters.loggedInAsGuest
            },
        },
        created(){
            this.$emit('changeLoadStatus',false);
            //this.$emit('nextStep');
            this.guest_list = this.$store.getters.userDetails.guest_lists;
        },
        methods:{
            validateInputs(){
                let error=0;
                this.booking_details.guests.forEach((data,index) => {
                    if(index==0){
                        this.validateRequired(data.guest_title_id) ? error++ : '';
                        this.validateRequired(data.first_name) ? error++ : '';
                        this.validateRequired(data.last_name) ? error++ : '';
                        this.validateRequired(data.country_code) ? error++ : '';
                        this.validateRequired(data.phone_number) ? error++ : '';
                    }

                });
                if(error==0){
                    //this.confirmation_modal=true
                    this.swal_confirm_submit_data.title=this.booking_details.guests[0].email.value;
                    this.swal_confirm_submit_data.text="Please confirm if your email address is correct and active.";
                    this.swal_confirm_submit_data.confirmButtonText="Yes, it is correct.";
                    this.swal_confirm_submit_data.cancelButtonText="No, i will change it.";
                    //this.$emit('nextStep');
                    this.swalConfirmSubmit((data)=>{
                        if (data.value) {

                            this.$nextTick(() => {
                                this.$emit('nextStep');
                            });
                        }else{
                            this.$emit('changeLoadStatus',false);
                        }
                    });
                }else{
                    this.$emit('changeLoadStatus',false);
                }
            },
            changeUserDetails(data){
                this.booking_details.user.details = data;
            },
            validateRequired(data){
                if(data.value==''){
                    data.error=true;
                    return true;
                }else{
                    data.error=false;
                    return false;
                }
            },
            closeConfirmationModal(){
                this.$emit('changeLoadStatus',false);
            },
            chooseFromGuestList(index){
                this.selected_guest_index=index;
                this.guest_list_modal=true;
            },
            assignGuest(guest){
                this.booking_details.guests[this.selected_guest_index].db_id = guest.id;
                this.booking_details.guests[this.selected_guest_index].guest_title_id={value:guest.guest_title_id,error:false};
                this.booking_details.guests[this.selected_guest_index].first_name={value:guest.first_name,error:false};
                this.booking_details.guests[this.selected_guest_index].last_name={value:guest.last_name,error:false};
                this.booking_details.guests[this.selected_guest_index].country_code={value:guest.country_code_id,error:false};
                this.booking_details.guests[this.selected_guest_index].phone_number={value:guest.phone_number,error:false};
                this.booking_details.guests[this.selected_guest_index].email={value:guest.email,error:false};
                this.guest_list_modal=false;
                this.selected_guest_index=-1;
            },
            resetGuest(index){
                this.booking_details.guests[index].db_id = -1;
                this.booking_details.guests[index].guest_title_id={value:'',error:false};
                this.booking_details.guests[index].first_name={value:'',error:false};
                this.booking_details.guests[index].last_name={value:'',error:false};
                this.booking_details.guests[index].country_code={value:'',error:false};
                this.booking_details.guests[index].phone_number={value:'',error:false};
                this.booking_details.guests[index].email={value:'',error:false};
            }
        }
    }
</script>

<style>
    .guest-tabs{
        border: none !important;
    }
    .guest-tabs .nav-item .nav-link{
        margin-right:2px;
    }
    .guest-tabs-active{
        background: #20a8d8 !important;
        color: #fff!important;
        border-bottom: none!important;
        margin-bottom:-2px;
        margin-left:1px;
        font-weight: bold;
    }
    .guest-tabs .nav-item .nav-link:hover,.guest-tabs .nav-item .nav-link:focus{
        background: #20a8d8 !important;
        color: #fff!important;
        border-bottom-color:transparent!important;
        margin-left:1px;
    }
</style>