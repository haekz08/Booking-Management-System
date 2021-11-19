<template>
    <div>
        <div id="paypal-button-container"></div>
    </div>
</template>

<script>
    import {paypal_details} from '@/config';
    export default {
        name: "AnotherPaypal",
        data() {
            return {
                paypal_details:{}
            }
        },
        mounted(){
            const script = document.createElement("script");
            script.src = 'https://www.paypal.com/sdk/js?client-id=ATelyUKZDOAXIyyZgMsAcvZBDXEXWdEz2ctqRS9xWH-IGOwi0S4_1ssC5Y7puoNu1ebbEMFmaJ-rej7z&currency=EUR&disable-funding=credit,card';
            script.addEventListener("load", this.checkOut);
            document.body.appendChild(script);
        },
        created(){
            this.paypal_details = paypal_details;
        },
        methods:{
            checkOut() {
                window.paypal.Buttons({
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
        }
    }
</script>

<style scoped>

</style>