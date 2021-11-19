<template>
  <div class="app">
    <div class="bg-white border-bottom p-3 pl-0 m-0 sticky-top">
      <div class="container">
        <b-row class="row">
          <b-col cols="6">
            <router-link to="/">
              <img class="navbar-brand-full" :src="assets_path.MEDSAILING_ASSETS + '/logo.png'"  height="50" alt="Medsailing Logo">
            </router-link>
          </b-col>
          <b-col cols="6" class="text-right">
              <nav class="navbar navbar-expand-lg float-right">
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                  <ul class="navbar-nav h6">
                    <!-- <li class="nav-item">
                      <a class="nav-link pl-3" href="#"><i class="fa fa-ship"></i> My Bookings</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link pl-3" href="#"><i class="fa fa-question-circle"></i> Trip Status</a>
                    </li> -->
                    <li class="nav-item" v-if="!loggedIn">
                      <a class="nav-link pl-3 text-primary" href="/login"><i class="fa fa-user-circle"></i> Sign In</a>
                    </li>
                    <li class="nav-item" v-else>
                      <a class="nav-link pl-3 text-primary" href="/bookings"><i class="fa fa-user-circle"></i> Hi {{userDetails.full_name}}!</a>
                    </li>
                  </ul>
                </div>
              </nav>
          </b-col>
        </b-row>
      </div>
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
import nav from '@/_nav'
import {assets_path} from '@/config';
import { Header as AppHeader} from '@coreui/vue'
export default {
  name: 'BookingContainer',
  components: {
    AppHeader,
  },
  data () {
    return {
      nav: nav.items,
      assets_path:{}
    }
  },
  created(){
    this.assets_path = assets_path;
  },
  computed: {
    name () {
      return this.$route.name
    },
    list () {
      //console.log(this.$route);
      return this.$route.matched.filter((route) => route.name || route.meta.label )
    },
    loggedIn(){
        return this.$store.getters.loggedIn
    },
    userDetails(){
      return this.$store.getters.userDetails
    }
  }
}
</script>
