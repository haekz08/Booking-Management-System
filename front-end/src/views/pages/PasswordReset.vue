<template>
  <div class="app flex-row align-items-center">
    <div class="container">
      <b-row class="justify-content-center">
        <b-col md="8">
          <b-card-group>
            <b-card no-body class="p-4">
              <b-card-body>
                <b-row align-v="center" class="modal-loader" v-if="is_loading">
                    <b-col>
                        <b-spinner></b-spinner>
                        <br><br>
                        <strong>Loading</strong>
                    </b-col>
                </b-row>
                <div class="d-lg-none d-block text-center mb-4">
                  <img class="w-50" :src="assets_path.MEDSAILING_ASSETS + '/logo.png'" alt="Med Sailing Holidays Logo">
                </div>
                
                <b-form v-on:submit.prevent="changePassword">
                  <!-- <h1>Login</h1> -->
                  <p class="text-muted">Enter new password for <strong class="text-primary">{{form_data.email}}</strong></p>

                  <b-input-group class="mb-4">
                    <b-input-group-prepend><b-input-group-text><i class="icon-lock"></i></b-input-group-text></b-input-group-prepend>
                    <b-form-input type="password" class="form-control" placeholder="New Password" v-model="form_data.password" />
                  </b-input-group>

                  <b-input-group class="mb-4">
                    <b-input-group-prepend><b-input-group-text><i class="icon-lock"></i></b-input-group-text></b-input-group-prepend>
                    <b-form-input type="password" class="form-control" placeholder="Confirm Your Password" v-model="form_data.password_confirmation" />
                  </b-input-group>

                  <b-row>
                    <b-col cols="6">
                      <b-button type="submit" variant="primary" class="px-4">Submit</b-button>
                    </b-col>
                  </b-row>
                </b-form>
              </b-card-body>
            </b-card>
            <b-card no-body class="text-white bg-light py-5 d-md-down-none" style="width:44%">
              <b-card-body class="text-center p-5 d-flex align-items-center">
                <img class="w-100" :src="assets_path.MEDSAILING_ASSETS + '/logo.png'" alt="Med Sailing Holidays Logo">
              </b-card-body>
            </b-card>
          </b-card-group>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>

import {client_details,assets_path} from '@/config';
import SwalMixin from '@/views/mixins/Swal.js';
export default {
  name: 'PasswordReset',
  mixins:[SwalMixin],
  data(){
      return{
          form_data:{
              email:'',
              password:'',
              password_confirmation:'',
              token:'',
          },
          assets_path:{},
          is_loading:false
      }
  },
  created() {
    //if(this.loggedIn){this.$router.push('/')}
    this.assets_path = assets_path;
    this.validateToken();
  },
  methods:{
      validateToken(){
        let reset_token = this.$route.params.reset_token;
        this.axios.get('password/find',{
            params: {
                        token: reset_token,
                    }
          }).then(response => {
            this.form_data.email = response.data.email;
            this.form_data.token = response.data.token;

        }).catch(error => {
            //this.swal_transaction_error_data.text="Error.";
            this.swalRequestError();
        });
      },
      changePassword(){
        this.is_loading=true;
        this.axios.post('password/reset',this.form_data).then(response => {
            this.swal_transaction_completed_data.title="Password Successfully Changed"
            this.swal_transaction_completed_data.text="You may now log in using your new password.";
            this.swalTransactionCompleted();
            this.$router.push('/login')

        }).catch(error => {
            this.swalRequestError();
            this.is_loading=false;
        });
      }
  }
}
</script>
