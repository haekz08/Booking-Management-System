<template>
    <div class="animated fadeIn container">
        <b-form v-on:submit.prevent="login" v-if="!forgot_password">
            <b-input-group class="mb-3">
            <b-input-group-prepend><b-input-group-text><i class="icon-user"></i></b-input-group-text></b-input-group-prepend>
            <b-form-input
            type="text"
            class="form-control"
            placeholder="Email"
            v-model="credentials.username"
            v-bind:class="{ 'is-invalid': hasError.username }"
            autocomplete="off"
            />

            </b-input-group>
            <b-input-group class="mb-4">
            <b-input-group-prepend><b-input-group-text><i class="icon-lock"></i></b-input-group-text></b-input-group-prepend>
            <b-form-input type="password" class="form-control" v-bind:class="{ 'is-invalid': hasError.password }" placeholder="Password" autocomplete="current-password" v-model="credentials.password" />
            </b-input-group>
            <b-row>
            <b-col cols="6">
                <b-button variant="primary" disabled v-if="isloading">
                <template v-if="isLoggingIn">
                    <b-spinner small type="grow"></b-spinner>
                    Logging In...
                </template>
                <template v-else>
                    <b-spinner small type="grow"></b-spinner>
                    Loading...
                </template>
                </b-button>
                <b-button type="submit" variant="primary" class="px-4" v-else @click="login">Login</b-button>
            </b-col>
            <b-col cols="6" class="text-right">
                <b-button variant="link" class="px-0" @click="forgot_password=true">Forgot password?</b-button>
            </b-col>
            </b-row>
        </b-form>

        <template v-else>
            <!-- <h1>Login</h1> -->
            <p class="text-muted">Enter your email address.</p>
            <b-input-group class="mb-3">
            <b-input-group-prepend><b-input-group-text><i class="icon-user"></i></b-input-group-text></b-input-group-prepend>
            <b-form-input
            type="text"
            class="form-control"
            placeholder="Email"
            v-model="recover_email"
            v-bind:class="{ 'is-invalid': hasError.recover_email }"
            autocomplete="off"
            />

            </b-input-group>
            <b-row>
                <b-col>
                    <b-button variant="primary" disabled v-if="isloading">
                    <template v-if="isLoggingIn">
                        <b-spinner small type="grow"></b-spinner>
                        Logging In...
                    </template>
                    <template v-else>
                        <b-spinner small type="grow"></b-spinner>
                        Loading...
                    </template>
                    </b-button>
                    <b-button type="submit" variant="primary" class="px-4" v-else @click="passwordReset">Send Password Reset Link</b-button>
                </b-col>
                
                <b-col cols="2" class="text-right">
                    <b-button variant="link" class="px-0" @click="forgot_password=false">Login</b-button>
                </b-col>
            </b-row>
        </template>
    </div>
</template>

<script>
    import {bus} from '@/main.js';
    import SwalMixin from '@/views/mixins/Swal.js';
    import {client_details} from '@/config';
    export default {
        name: 'Book',
        mixins:[SwalMixin],
        data(){
            return{
                credentials:{
                    username: '',
                    password:'',
                    grant_type: 'password',
                    client_id: client_details.CLIENT_ID,
                    client_secret:  client_details.CLIENT_SECRET
                },
                hasError:{
                    username: false,
                    password:false
                },
                isloading:false,
                isLoggingIn:false,
                forgot_password:false,
                assets_path:{},
                recover_email:''
            }
        },
        methods:{
            passwordReset(){
                this.isloading=true;
                this.axios.post('password/create',{email:this.recover_email}).then(payment_response => {

                    this.swal_transaction_completed_data.title="Email Sent"
                    this.swal_transaction_completed_data.text="You will receive an email with instructions on how to reset your password in a few minutes.";
                    this.swalTransactionCompleted();
                    this.isloading=false;

                }).catch(error => {
                    this.swalRequestError();
                    this.isloading=false;
                });
            },
            login(){
                this.isloading = true
                let valid=this.validate();
                if(!valid){
                    this.isloading = false
                    this.$swal({
                        title: 'Error!',
                        text: 'Please provide an email and password!',
                        showCloseButton: true,
                        onClose: () => {
                            this.showErrors()
                        },
                    })
                }else{
                    setTimeout(() => {
                        this.$store.dispatch('logInAction',this.credentials)
                        .then(response => {
                            this.isLoggingIn=true;

                            setTimeout(() => {
                            //sthis.$router.push('/dashboard')
                                bus.$emit('logInModalClose');
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
                if(this.credentials.username.length <= 0){
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
                if(this.credentials.username.length <= 0){
                    this.hasError.username=true
                }else{
                    this.hasError.username=false
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

<style>

</style>
