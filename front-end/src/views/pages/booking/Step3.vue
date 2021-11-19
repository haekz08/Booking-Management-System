<template>
    <div class="p-3">
        <b-row class="bg-primary border border-secondary">
            <b-col class="p-2">
                <strong>
                    How would you like to pay?
                </strong>
            </b-col>
        </b-row>
        <b-row class="border border-top-0 border-secondary">
            <b-col class="p-3">
                <b-row class="m-0 rounded bg-light border border-secondary">
                    <b-col lg="12" xl="4" id="payment-1" @click="changePaymentType(3)" class="cursor-pointer text-center p-2" :class="{'bg-primary':payment_type==3}">
                        <i class="fa fa-fw fa-bank h1"></i>
                        <h5>Bank Transfer/<br>Money Order</h5>
                    </b-col>
                    <b-popover target="payment-1" triggers="hover" placement="top">
                        <template v-slot:title>Bank Transfer/Money Order</template>
                        <p class="text-justify">
                            Click here for bank transfer/ money order instructions.
                        </p>
                    </b-popover>
                    <b-col lg="12" xl="4" id="payment-2" @click="changePaymentType(1)" class="cursor-pointer text-center p-2" :class="{'bg-primary':payment_type==1}">
                        <i class="fa fa-fw fa-credit-card h1"></i>
                        <h5>Credit Card</h5>
                    </b-col>

                    <b-popover target="payment-2" triggers="hover" placement="top">
                        <template v-slot:title>Credit Card</template>
                        <p class="text-justify">
                            Click here for instructions to pay by credit card
                        </p>
                    </b-popover>
                    <b-col lg="12" xl="4" id="payment-3" class="text-center d-xl-flex align-items-center py-4 p-xl-0 p-xl-2">
                        <!--<i class="fa fa-fw fa-cc-paypal h1"></i>-->
                        <!--<h5>PayPal</h5>-->
                        <div id="paypal-button-container2"></div>
                    </b-col>
                    <b-popover target="payment-3" triggers="hover" placement="top">
                        <template v-slot:title>PayPal</template>
                        <p class="text-justify">
                            Click here to pay by PayPal
                        </p>
                    </b-popover>
                </b-row>
            </b-col>
        </b-row>

        <b-row class="bg-primary border border-secondary mt-3">
            <b-col class="p-2">
                <strong>
                    {{ payment_type_heading }}
                </strong>
            </b-col>
        </b-row>
        <b-row class="border border-top-0 border-secondary">
            <b-col class="p-3">
                <h3 class="pb-2">
                    Amount Due : <strong>&euro; {{amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                </h3>
                <div v-show="payment_type==1">
                    <div class="py-3 bg-dark text-center">
                        <h4 class="d-none d-md-block">Click the button below to pay with Paypal Credit Card.</h4>
                        <h6 class="d-block d-md-none">Click the button below to pay with Paypal Credit Card.</h6>
                        <i class="mb-0 h3 fa fa-fw fa-arrow-circle-down blink"></i>
                    </div>
                    <div id="paypal-button-container"></div>
                    <!--<div class="text-center">-->
                        <!--<img :src="assets_path.MEDSAILING_ASSETS+'accredited-cards.jpg'" alt="Accepted Cards" class="w-50" >-->
                    <!--</div>-->
                    <div class="p-3 rounded bg-light border border-secondary">
                        <h6>Easy Steps: </h6>
                        <hr>
                        <p>
                            Please be reminded that there will be a 4% transaction fee that will be added on top of your due amount if you select this method of payment.
                        </p>
                        <b-row align-v="center" class="p-2">
                            <b-col cols="12" lg="7" class="p-0">
                                <img :src="assets_path.MEDSAILING_ASSETS+'cc-step1.jpg'" alt="Step 1" class="w-100" >
                            </b-col>
                            <b-col class="p-0" cols="12" lg="5">
                                <ol>
                                    <li style="margin-bottom: 10px !important;">
                                        Please click the “Pay with PayPal” button and it will lead you to the page where you select which method of payment to choose from.
                                    </li>
                                </ol>
                            </b-col>
                        </b-row>
                        
                        <b-row align-v="center" class="mt-2 bg-white p-2">
                            <b-col cols="12" lg="7" class="p-0">
                                <img :src="assets_path.MEDSAILING_ASSETS+'cc-step2.jpg'" alt="Step 2" class="w-100" >
                            </b-col>
                            <b-col class="p-0" cols="12" lg="5">
                                <ol start="2">
                                    <li style="margin-bottom: 10px !important;">
                                        Click the “Pay with Debit or Credit Card” button to proceed to the next page.
                                    </li>
                                </ol>
                            </b-col>
                        </b-row>

                        <b-row align-v="center" class="mt-2 p-2">
                            <b-col cols="12" lg="7" class="p-0">
                                <img :src="assets_path.MEDSAILING_ASSETS+'cc-step3.jpg'" alt="Step 2" class="w-100" >
                            </b-col>
                            <b-col class="p-0" cols="12" lg="5">
                                <ol start="3">
                                    <li style="margin-bottom: 10px !important;">
                                        Fill in the required details and once you’re done, click the “Pay Now” button at the bottom part of the form.
                                    </li>
                                </ol>
                            </b-col>
                        </b-row>
                        <p>
                            You’ll see a confirmation window indicating that your payment has been received and that you’ll be receiving a confirmation email as a form of documentation of the transaction. Thank you.
                        </p>
                        <p>
                            *Note: Extras are not included in the price (dinner, water taxis, alcohol, excursions or gratuities). There is a strict no refund policy for any cancellations under 12 weeks from departure date.
                        </p>
                    </div>
                </div>
                
                <div v-show="payment_type==3">
                    <div class="p-3 rounded bg-light border border-secondary">
                        <h6>Easy Steps: </h6>
                        <hr>
                        <p>
                            Please be reminded that international bank transfer usually takes 4-5 business days to reflect in our account. We will send you a receipt after receiving your payment.
                        </p>
                        <ol>
                            <li style="margin-bottom: 10px !important;">
                                For bank payments, please use your surname as your reference.
                            </li>
                            <li style="margin-bottom: 10px !important;">
                                Please refer to our bank details below: <br />
                                <p style="margin-top:5px;">
                                ACCOUNT NAME: Med Sailing Holidays CY Ltd  <br />
                                ACCOUNT NUMBER: 357023540571  <br />
                                SWIFT / BIC: BCYPCY2N / BCYPCY2NXXX  <br />
                                IBAN: CY49 0020 0195 0000 3570 2354 0571 (with no spaces)  <br />
                                BANK OF CYPRUS  <br />
                                51 STASSINOS STREET  <br />
                                AYIA PARASKEVI, STROVOLOS  <br />
                                2002 NICOSIA (LEFKOSIA)
                                </p>
                            </li>
                            <li style="margin-bottom: 10px !important;">
                                Please ensure you and your group have read and understand the terms and conditions listed on our website <a href="https://www.medsailingholidays.com/terms-and-conditions">www.medsailingholidays.com/terms-and-conditions</a>.
                            </li>
                        </ol>
                        <p>
                            *Note: Extras are not included in the price (dinner, water taxis, alcohol, excursions or gratuities). There is a strict no refund policy for any cancellations under 12 weeks from departure date.
                        </p>
                    </div>
                </div>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import {paypal_details,assets_path} from '@/config';
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
                payment_type_heading:'Paypal',
                payment_type:3,
                amount_due:0,
                description:'',
                load:true,
                paypal_confirm_modal:false,
                form_data:{},
                paypal_details:{},
                assets_path:{}
            }
        },
        watch: {
            
        },
        created(){
            this.paypal_details = paypal_details;
            this.assets_path = assets_path;
            this.description = this.booking_details.itinerary.itinerary_country.name+' ('
                                +this.booking_details.itinerary.itinerary_city_from.name+' to '+this.booking_details.itinerary.itinerary_city_to.name+') - '
                                +this.booking_details.itinerary.check_in.other_formats.format_1;
        },
        mounted(){
            this.payment_type = this.booking_details.payment_type;
            this.setAmountDue();

            const script = document.createElement("script");
            script.src = this.paypal_details.PAYPAL_URL;
            script.addEventListener("load", this.checkOut);
            script.addEventListener("load", this.checkOut2);
            document.body.appendChild(script);
        },
        methods:{
            changePaymentType(payment_type){
                console.log(payment_type);
                //this.payment_type_heading =  payment_type == 1 ? "Paypal" : "Bank Transfer";
                this.booking_details.payment_type=payment_type;
                this.payment_type=payment_type;
                this.setAmountDue();
            },
            setAmountDue(){
                if(this.booking_details.payment_terms==1){
                    this.amount_due = this.total_amount_due;
                }else{
                    this.amount_due = this.booking_details.deposit_amount_due;
                }
            },
            checkOut() {
                window.paypal.Buttons({
                    style: {
                        color:  'blue',
                        label: 'pay',
                        fundingicons : true
                    },
                    createOrder: (data, actions) => {
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: this.amount_due,
                                },
                                description: this.description
                            }]
                        });
                    },

                    onApprove: (data, actions) => {
                        return actions.order.get().then((orderDetails) => {
                            let form_data = this.booking_details;
                            form_data.grand_total = this.total_amount_due;

                            return this.axios.post('booking/save',form_data).then(booking_response => {
                                this.axios.defaults.headers.common['Authorization']= 'Bearer '+booking_response.data.token;
                                let payment_data={};

                                return actions.order.capture().then( status => {
                                    payment_data.active_invoice = booking_response.data.booking_details.active_invoice
                                    payment_data.paypal_response = status
                                    this.axios.post('bookings/save_invoice_payment_paypal',payment_data).then(payment_response => {
                                        this.swalTransactionCompleted();
                                        this.$nextTick(() => {
                                            this.$router.push(
                                            {
                                                name: 'ThankYou',
                                                params: { id: booking_response.data.booking_details.id, token: booking_response.data.token }
                                            });
                                        });

                                    }).catch(error => {
                                        this.swal_transaction_error_data.text="Payment transaction failed.";
                                        this.swalRequestError();
                                    });
                                    this.$emit('changeLoadStatus',false);
                                });
                            }).catch(error => {
                                this.$emit('changeLoadStatus',false);
                                this.swal_transaction_error_data.text="Error Occured.";
                                this.swalRequestError();
                            });

                        });
                    },
                    onClick: (data, actions) => {
                        this.$emit('changeLoadStatus',true);
                    },
                    onCancel: (data, actions) => {
                        this.$emit('changeLoadStatus',false);
                    },
                    onError: (err) => {
                        this.$emit('changeLoadStatus',false);
                        this.swal_transaction_error_data.text="Error Occured.";
                        this.swalRequestError();
                    },
                    onInit: (data, actions) => {
                        this.$emit('changeLoadStatus',false);
                    }
                }).render('#paypal-button-container');
            },
            checkOut2() {
                window.paypal.Buttons({
                    style: {
                        size:  'responsive',
                    },
                    createOrder: (data, actions) => {
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: this.amount_due,
                                },
                                description: this.description
                            }]
                        });
                    },

                    onApprove: (data, actions) => {
                        return actions.order.get().then((orderDetails) => {
                            let form_data = this.booking_details;
                            form_data.grand_total = this.total_amount_due;

                            return this.axios.post('booking/save',form_data).then(booking_response => {
                                this.axios.defaults.headers.common['Authorization']= 'Bearer '+booking_response.data.token;
                                let payment_data={};

                                return actions.order.capture().then( status => {
                                    payment_data.active_invoice = booking_response.data.booking_details.active_invoice
                                    payment_data.paypal_response = status
                                    this.axios.post('bookings/save_invoice_payment_paypal',payment_data).then(payment_response => {
                                        this.swalTransactionCompleted();
                                        this.$nextTick(() => {
                                            this.$router.push(
                                                {
                                                    name: 'ThankYou',
                                                    params: { id: booking_response.data.booking_details.id, token: booking_response.data.token }
                                                });
                                        });

                                    }).catch(error => {
                                        this.swal_transaction_error_data.text="Payment transaction failed.";
                                        this.swalRequestError();
                                    });
                                    this.$emit('changeLoadStatus',false);
                                });
                            }).catch(error => {
                                this.$emit('changeLoadStatus',false);
                                this.swal_transaction_error_data.text="Error Occured.";
                                this.swalRequestError();
                            });

                        });
                    },
                    onClick: (data, actions) => {
                        this.$emit('changeLoadStatus',true);
                    },
                    onCancel: (data, actions) => {
                        this.$emit('changeLoadStatus',false);
                    },
                    onError: (err) => {
                        this.$emit('changeLoadStatus',false);
                        this.swal_transaction_error_data.text="Error Occured.";
                        this.swalRequestError();
                    },
                    onInit: (data, actions) => {
                        this.$emit('changeLoadStatus',false);
                    }
                }).render('#paypal-button-container2');
            }
        }
    }
</script>

<style scoped>
.cursor-pointer{
  cursor: pointer;
}
</style>