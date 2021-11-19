<template>
    <div>
        <b-row align-v="center" class="modal-loader" v-if="is_loading">
            <b-col>
                <b-spinner></b-spinner>
                <br><br>
                <strong>Loading</strong>
            </b-col>
        </b-row>
        <b-row class="m-0">
            <b-col class="p-3">
                <b-row class="m-0 bg-primary border border-secondary">
                    <b-col class="p-2">
                        <strong>
                            How would you like to pay?
                        </strong>
                    </b-col>
                </b-row>
                <b-row class="m-0 border border-top-0 border-secondary">
                    <b-col class="p-3">
                        <b-row class="m-0 rounded bg-light border border-secondary">
                            <b-popover target="payment-1" triggers="hover" placement="top">
                                <template v-slot:title>Bank Transfer/Money Order</template>
                                <p class="text-justify">
                                    Click here for bank transfer/ money order instructions.
                                </p>
                            </b-popover>
                            <b-col lg="12" xl="6" id="payment-2" @click="changePaymentType(1)" class="cursor-pointer text-center p-2" :class="{'bg-primary':payment_type==1}">
                                <i class="fa fa-fw fa-credit-card h1"></i>
                                <h5>Credit Card</h5>
                            </b-col>

                            <b-popover target="payment-2" triggers="hover" placement="top">
                                <template v-slot:title>Credit Card</template>
                                <p class="text-justify">
                                    Click here for instructions to pay by credit card
                                </p>
                            </b-popover>
                            <b-col lg="12" xl="6" id="payment-3" class="text-center d-xl-flex align-items-center py-4 p-xl-0 p-xl-2">
                                <!--<i class="fa fa-fw fa-cc-paypal h1"></i>-->
                                <!--<h5>PayPal</h5>-->
                                <div class="w-100">
                                    <div id="paypal-button-container2"></div>
                                </div>
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

                <b-row class="m-0 bg-primary border border-secondary mt-3">
                    <b-col class="p-2">
                        <strong>
                            {{ payment_type_heading }}
                        </strong>
                    </b-col>
                </b-row>
                <b-row class="m-0 border border-top-0 border-secondary">
                    <b-col class="p-3">
                        <h3 class="pb-2">
                            Amount Due : <strong>{{active_invoice.invoice_balance.other_formats.format_1.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
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
                    </b-col>
                </b-row>
            </b-col>
        </b-row>
        <!-- <div class="m-3 p-3 shadow">
            <b-row class="m-0">
                <b-col class="pl-0 pr-0">
                    <h3 class="pb-2">
                        Amount Due : <strong>{{active_invoice.invoice_balance.other_formats.format_1.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</strong>
                    </h3>
                    <div id="paypal-button-container"></div>
                    <div class="text-center">
                        <img :src="assets_path.MEDSAILING_ASSETS+'accredited-cards.jpg'" alt="Accepted Cards" class="w-50" >
                    </div>
                     <div class="p-3 rounded bg-light border border-secondary">
                        <h6>Easy Steps:</h6>
                        <hr>
                        <p>
                            1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper nisl et congue pharetra. Sed suscipit enim tellus, a porttitor enim condimentum mattis. Pellentesque et magna eu nibh molestie tristique. Aliquam condimentum purus non eros sodales laoreet. 
                        </p>
                        <p>
                            2. Duis condimentum massa nec massa ultricies, et rhoncus dui suscipit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris egestas aliquam elit, sodales euismod lacus mattis non.
                        </p>
                        <p>
                            3. Sed augue augue, elementum id porttitor in, ullamcorper id odio. Curabitur ipsum ante, rhoncus sed velit quis, condimentum eleifend justo. Vivamus quis leo gravida nisi dignissim malesuada. Nulla tincidunt metus leo, a hendrerit libero egestas eu. Quisque quis lacus malesuada, euismod turpis sed, tempus orci. Etiam tincidunt maximus leo, sed lacinia arcu.
                        </p>
                    </div>
                </b-col>
            </b-row>
        </div> -->
    </div>
</template>

<script>
    import {bus} from '@/main.js'
    import SwalMixin from '@/views/mixins/Swal.js'
    import {paypal_details,assets_path} from '@/config';
    export default {
        name: 'paypal',
        inheritAttrs: false,
        mixins:[SwalMixin],
        props: {
            active_invoice: {
                type: [Array, Object],
                default: () => []
            },
            booking_details: {
                type: [Array, Object],
                default: () => []
            }
        },
        data(){
            return {
               paypal_details:{},
               assets_path:{},
               payment_type_heading:'Credit Card',
               payment_type:1, 
               paypal_description:'',
               is_loading:true
            }
        },
        created(){
            this.paypal_details = paypal_details;
            this.assets_path = assets_path;
            this.paypal_description = 'Payment for booking '+this.booking_details.reference_code_char+this.booking_details.reference_code;
        },
        methods: {
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
                                    value: this.active_invoice.invoice_balance.default,
                                },
                                description:this.paypal_description
                            }]
                        });
                    },

                    onApprove: (data, actions) => {
                      return actions.order.capture().then( status => {
                            let payment_data={};
                            payment_data.active_invoice = this.active_invoice;
                            payment_data.paypal_response = status;
                            this.is_loading=true;
                            this.axios.post('bookings/save_invoice_payment_paypal',payment_data).then(payment_response => {
                                this.swalTransactionCompleted();
                                this.is_loading=false;
                                bus.$emit('paypalModalClose');
                                // this.$nextTick(() => {
                                //     this.$router.push({ name: 'ThankYou'});
                                // });
                            }).catch(error => {
                                this.swal_transaction_error_data.text="Payment transaction failed.";
                                this.swalRequestError();
                                this.is_loading=false;
                            });
                            //this.$emit('changeLoadStatus',false);
                            this.is_loading=false;
                        });
                    },
                    onClick: (data, actions) => {
                        //this.$emit('changeLoadStatus',true);
                        this.is_loading=true;
                    },
                    onCancel: (data, actions) => {
                        //this.$emit('changeLoadStatus',false);
                        this.is_loading=false;
                    },
                    onError: (err) => {
                        //this.$emit('changeLoadStatus',false);
                        this.is_loading=false;
                        console.log(err)
                        this.swal_transaction_error_data.text="Error Occured.";
                        this.swalRequestError();
                    },
                    onInit: (data, actions) => {
                        //this.$emit('changeLoadStatus',false);
                        this.is_loading=false;
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
                                    value: this.active_invoice.invoice_balance.default,
                                },
                                description:this.paypal_description
                            }]
                        });
                    },

                    onApprove: (data, actions) => {
                      return actions.order.capture().then( status => {
                            let payment_data={};
                            payment_data.active_invoice = this.active_invoice;
                            payment_data.paypal_response = status;
                            this.is_loading=true;
                            this.axios.post('bookings/save_invoice_payment_paypal',payment_data).then(payment_response => {
                                this.swalTransactionCompleted();
                                this.is_loading=false;
                                bus.$emit('paypalModalClose');
                                // this.$nextTick(() => {
                                //     this.$router.push({ name: 'ThankYou'});
                                // });
                            }).catch(error => {
                                this.swal_transaction_error_data.text="Payment transaction failed.";
                                this.swalRequestError();
                                this.is_loading=false;
                            });
                            //this.$emit('changeLoadStatus',false);
                            this.is_loading=false;
                        });
                    },
                    onClick: (data, actions) => {
                        //this.$emit('changeLoadStatus',true);
                        this.is_loading=true;
                    },
                    onCancel: (data, actions) => {
                        //this.$emit('changeLoadStatus',false);
                        this.is_loading=false;
                    },
                    onError: (err) => {
                        //this.$emit('changeLoadStatus',false);
                        this.is_loading=false;
                        console.log(err)
                        this.swal_transaction_error_data.text="Error Occured.";
                        this.swalRequestError();
                    },
                    onInit: (data, actions) => {
                        //this.$emit('changeLoadStatus',false);
                        this.is_loading=false;
                    }
                }).render('#paypal-button-container2');
            },
        },
        mounted(){
            const script = document.createElement("script");
            script.src = this.paypal_details.PAYPAL_URL;
            script.addEventListener("load", this.checkOut);
            script.addEventListener("load", this.checkOut2);
            document.body.appendChild(script);
        }
    }
</script>
