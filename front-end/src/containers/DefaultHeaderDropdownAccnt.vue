<template>
    <AppHeaderDropdown right no-caret>
        <template slot="header">
            <img
                    style="object-fit: cover; width:35px;"
                    :src="thumbnail"
                    class="img-avatar"
                    alt="admin@bootstrapmaster.com"/>
        </template>
        <template slot="dropdown">
            <!-- <b-dropdown-header tag="div" class="text-center"><strong>Account</strong></b-dropdown-header>
            <b-dropdown-item><i class="fa fa-bell-o" /> Updates
              <b-badge variant="info">{{ itemsCount }}</b-badge>
            </b-dropdown-item>
            <b-dropdown-item><i class="fa fa-envelope-o" /> Messages
              <b-badge variant="success">{{ itemsCount }}</b-badge>
            </b-dropdown-item>
            <b-dropdown-item><i class="fa fa-tasks" /> Tasks
              <b-badge variant="danger">{{ itemsCount }}</b-badge>
            </b-dropdown-item>
            <b-dropdown-item><i class="fa fa-comments" /> Comments
              <b-badge variant="warning">{{ itemsCount }}</b-badge>
            </b-dropdown-item>
            <b-dropdown-header
              tag="div"
              class="text-center">
              <strong>Settings</strong>
            </b-dropdown-header>
            <b-dropdown-item><i class="fa fa-user" /> Profile</b-dropdown-item>
            <b-dropdown-item><i class="fa fa-wrench" /> Settings</b-dropdown-item>
            <b-dropdown-item><i class="fa fa-usd" /> Payments
              <b-badge variant="secondary">{{ itemsCount }}</b-badge>
            </b-dropdown-item>
            <b-dropdown-item><i class="fa fa-file" /> Projects
              <b-badge variant="primary">{{ itemsCount }}</b-badge>
            </b-dropdown-item>
            <b-dropdown-divider />
            <b-dropdown-item><i class="fa fa-shield" /> Lock Account</b-dropdown-item> -->
            <b-dropdown-item @click="myAccount"><i class="fa fa-user"/> My Account</b-dropdown-item>
            <b-dropdown-item @click="logout"><i class="fa fa-lock"/> Logout</b-dropdown-item>
        </template>
    </AppHeaderDropdown>
</template>

<script>
    import {HeaderDropdown as AppHeaderDropdown} from '@coreui/vue'
    import { assets_path } from '../config';
    import { bus } from '@/main'
    export default {
        name: 'DefaultHeaderDropdownAccnt',
        components: {
            AppHeaderDropdown
        },
        data: () => {
            return {
                itemsCount: 42,
                thumbnail:null
            }
        },
        created() {
            bus.$on('update_avatar',(data) => {
                this.$store.dispatch('updateProfilePictureAction', data);
                this.thumbnail = assets_path.THUMBNAIL_IMAGE_PATH+data.thumbnail;
            });
            let user = JSON.parse(this.$store.state.user);
            if(user.thumbnail != null){
                this.thumbnail = assets_path.THUMBNAIL_IMAGE_PATH+user.thumbnail;
            }else{
                this.thumbnail = assets_path.DEFAULT_THUMBNAIL_IMAGE;
            }
        },
        methods: {
            myAccount() {
                this.$router.push('/my-account')
            },
            logout() {
                this.$store.dispatch('logOutAction')
                    .then(response => {
                        this.$router.push('/login')
                    })
            }
        }
    }
</script>
