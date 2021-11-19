<template>
    <div class="container">
        <div class="row bg-white my-3">
            <div class="col-md-12 text-center">
                <div>
                    <img :src="logo" class="med-logo" alt="Medsailing Logo">
                </div>
                <p>
                    Thank you and congratulations on your booking! You will be receiving a booking confirmation email,
                    along with your welcome email with marina instructions as well as our packing tips.
                </p>
                <p>
                    You can go back and view your invoice and payment instructions by logging in to your account using
                    the credentials sent to your email.
                    Please make your payment (deposit) within 5 business days to secure your booking
                </p>
                <p>
                    One of the important things we require from our confirmed guests is their crew list. A crew list is
                    an official document that all passenger-carrying vessels are required to submit to the maritime
                    authorities by law.
                </p>
                <p>
                    We are required to submit the voyage’s crew list in advance to prevent any hold-ups with the
                    authorities and administration staff, so we kindly request that you fill out your guest profiles as
                    soon as you can.
                </p>
                <p>
                    Failure to fill up the guest profile with all important details such as your passport information in
                    time will prevent the boat from leaving on time and the worst-case scenario, would result in the
                    boat leaving without you. Think of it like arriving for a flight, but not having your passport with
                    you.
                </p>
                <div class="row mb-3">
                    <div class="col-md-6 my-4 px-5 btn-container">
                        <b-button variant="primary" block  size="sm" @click="goToBookings" class="text-uppercase">
                            Complete the Guest Profile Now
                        </b-button>
                        <b-modal v-model="login_modal" centered  hide-footer>
                            <template v-slot:modal-title>
                               MEDSAILING - Sign In to your account
                            </template>
                            <div class="d-block p-4">
                                <b-form v-on:submit.prevent="login">
                                    <b-input-group class="mb-3">
                                        <b-input-group-prepend><b-input-group-text><i class="icon-user"></i></b-input-group-text></b-input-group-prepend>
                                        <b-form-input
                                                type="text"
                                                class="form-control"
                                                placeholder="Email"
                                                v-model="credentials.email"
                                                v-bind:class="{ 'is-invalid': hasError.email }"
                                                autocomplete="off"
                                        />
                                    </b-input-group>
                                    <b-input-group class="mb-4">
                                        <b-input-group-prepend><b-input-group-text><i class="icon-lock"></i></b-input-group-text></b-input-group-prepend>
                                        <b-form-input type="password" class="form-control" v-bind:class="{ 'is-invalid': hasError.password }" placeholder="Password" autocomplete="current-password" v-model="credentials.password" />
                                    </b-input-group>
                                    <b-row>
                                        <b-col cols="6">
                                            <b-button variant="primary" disabled v-if="isloading" size="sm">
                                                <template v-if="isLoggingIn">
                                                    <b-spinner small type="grow"></b-spinner>
                                                    Logging In...
                                                </template>
                                                <template v-else>
                                                    <b-spinner small type="grow"></b-spinner>
                                                    Loading...
                                                </template>
                                            </b-button>
                                            <b-button type="submit" variant="primary" class="px-4" size="sm" @click="login" v-else>
                                                Login
                                            </b-button>
                                        </b-col>
                                        <b-col cols="6" class="text-right">
                                            <b-button variant="link" class="px-0" size="sm">
                                                Forgot password?
                                            </b-button>
                                        </b-col>
                                    </b-row>
                                </b-form>
                            </div>
                        </b-modal>
                    </div>
                    <div class="col-md-6 my-4 px-5 btn-container">
                        <b-button variant="primary" block  class="px-4 text-uppercase" size="sm" @click="goToBooking">
                            Book Again
                        </b-button>
                    </div>
                </div>
                <p>
                    Please feel free to let us know if you need further assistance by contacting us at
                    info@medsailingholidays.com and one of our back office team will be in touch.
                </p>
                <p>
                    Once again, thank you and congratulations for choosing to sail with us. You’re going to have an
                    amazing time!
                </p>
            </div>
        </div>

    </div>
</template>

<script>
    import {client_details} from '@/config';
    export default {
        name: 'ThankYou',
        data() {
            return {
                logo: require('../../../../public/img/medsailing-logo.png'),
                login_modal: false,
                isloading:false,
                isLoggingIn:false,
                credentials:{
                    email: '',
                    password:'',
                    grant_type: 'password',
                    client_id: client_details.CLIENT_ID,
                    client_secret:  client_details.CLIENT_SECRET
                },
                hasError:{
                    email: false,
                    password:false
                },
            }
        },
        created() {
            // console.log(this.$route.params.id);
            // console.log(this.$route);
        },
        methods: {
            goToBookings() {
                if (typeof this.$route.params.token == "undefined") {
                    this.login_modal = true;
                } else {
                    this.axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.$route.params.token;
                    this.axios.get('/user/get').then(
                        response => {
                            let credentials = {
                                user: response.data.user,
                                token: this.$route.params.token
                            };
                            this.$store.dispatch('logInActionUsingToken', credentials)
                                .then(response => {
                                    this.$router.push('/bookings');
                                })
                                .catch(error => {
                                    this.$swal({
                                        title: 'Error!',
                                        text: 'Contact Website Administrator!',
                                    })
                                })
                        }
                    );
                }
            },
            goToBooking() {
                this.$router.push('/booking');
            },
            login(){
                this.isloading = true
                let valid=this.validate();
                if(!valid){
                    this.isloading = false;
                    this.showErrors();
                }else{
                    setTimeout(() => {
                        this.$store.dispatch('logInAction',this.credentials)
                            .then(response => {
                                this.isLoggingIn=true;
                                setTimeout(() => {
                                    this.$router.push('/bookings');
                                },1000);
                            })
                            .catch(error => {
                                this.isloading = false
                                this.$swal({
                                    title: 'Error!',
                                    text: 'Incorrect email or password!',
                                    showCloseButton: true,
                                    onClose: () => {
                                        this.showErrors()
                                    },
                                })
                            })
                    },1000);
                }
            },
            validate(){
                let error=0;
                if(this.credentials.email.length <= 0){
                    error=1;
                }
                if(this.credentials.password.length <= 0){
                    error=1;
                }
                if(error==0){
                    return true
                }
            },
            showErrors(){
                if(this.credentials.email.length <= 0){
                    this.hasError.email=true
                }else{
                    this.hasError.email=false
                }
                if(this.credentials.password.length <= 0){
                    this.hasError.password=true
                }else{
                    this.hasError.password=false
                }
            }
        }
    }
</script>


<style scoped>
    body{
        background-color: #fff;
    }
    .med-logo {
        width: 100%;
        max-width: 320px;
    }
    p{
        text-align: justify;
        font-size: 16px;
        font-weight: 500;
    }
</style>