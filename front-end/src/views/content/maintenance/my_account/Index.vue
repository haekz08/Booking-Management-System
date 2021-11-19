<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col>
                <b-card>
                    <template v-slot:header>
                        <h6 class="mb-0"><i class="fa fa-fw fa-user"></i> My Account</h6>
                    </template>
                    <b-card-text>
                        <b-card no-body class="border-custom">
                            <b-tabs pills card vertical>
                                <b-tab @click="SelectComponent('profile')">
                                    <template v-slot:title>
                                        <b-card-text><i class="fa fa-fw fa-user"></i> User Profile</b-card-text>
                                    </template>
                                    <b-card-text class="p-3">
                                        <user-profile v-if="is_component == 'profile'"></user-profile>
                                    </b-card-text>
                                </b-tab>
                                <b-tab @click="SelectComponent('password')">
                                    <template v-slot:title>
                                        <b-card-text><i class="fa fa-fw fa-key"></i> Change Password</b-card-text>
                                    </template>
                                    <b-card-text class="p-3">
                                        <change-password v-if="is_component == 'password'"></change-password>
                                    </b-card-text>
                                </b-tab>
                            </b-tabs>
                        </b-card>
                    </b-card-text>
                </b-card>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import UserProfile from './user_profile/Index'
    import ChangePassword from './change_password/Index'
    export default {
        data(){
          return{
              is_component:'profile'
          }
        },
        components:{
            UserProfile,
            ChangePassword
        },
        methods:{
            SelectComponent(component){
                this.is_component = component;
            }
        }
    }
</script>

<style>
    .card.border-custom .tabs .tab-content {
        border-top: 1px solid #c8ced3;
        border-left: 1px solid #c8ced3;
    }
</style>