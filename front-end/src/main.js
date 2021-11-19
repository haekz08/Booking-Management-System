// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'core-js/es6/promise'
import 'core-js/es6/string'
import 'core-js/es7/array'
// import cssVars from 'css-vars-ponyfill'
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import App from './App'
import router from './router'

import VueSweetalert2 from 'vue-sweetalert2'
import VeeValidate from 'vee-validate'

import axios from 'axios'
import VueAxios from 'vue-axios'
import Vuex from 'vuex'

import {store} from './store/store.js'

import {server_details} from './config.js';

// todo
// cssVars()

Vue.use(BootstrapVue)
Vue.use(VueSweetalert2)
Vue.use(VeeValidate, {
    // This is the default
    inject: true,
    // Important to name this something other than 'fields'
    fieldsBagName: 'veeFields'
})
Vue.use(VueAxios, axios)
Vue.use(Vuex)
axios.defaults.headers.common['Authorization']= 'Bearer '+store.state.token;

axios.defaults.baseURL = server_details.SERVER_URL;

router.beforeEach((to, from, next) => {
    //console.log(to.path);
    // if (store.getters.loggedIn && to.path=='/login') {
    //     next({
    //         path: '/'
    //     })
    // } else {
    //     next()
    // }
    if (!store.getters.loggedIn && to.path=='/') {
        next({
            path: '/booking'
        })
    } else {
        next()
    }
    //next()
})
/* eslint-disable no-new */

export const bus=new Vue();
new Vue({
  el: '#app',
  store:store,
  router,
  template: '<App/>',
  components: {
    App
  },
  data(){
    return {
        itinerary_brands:[]
    }
  },
  computed:{
    loggedIn(){
        return this.$store.getters.loggedIn
    }
  },
  created(){
      if(this.loggedIn){
          this.$store.dispatch('setRoutesAction',JSON.parse(this.$store.state.user))
          setTimeout(() => {
              let resolved = router.resolve(router.history.current.path);
              if( resolved.resolved.matched.length > 0){
                  router.push(router.history.current.path)
              }else{
                  router.push('/404')
              }
          },1000);
      }else{
          //router.push('/login')
      }
  },
  methods:{

  }
})
