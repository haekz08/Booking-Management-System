import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

import router from '../router'

Vue.use(Vuex)

export const store= new Vuex.Store({
    state:{
        token:localStorage.getItem('token') || null,
        user:localStorage.getItem('user') || null,
        loading:false
    },
    mutations:{
        retrieveStorage(state,payload){
            state.token = payload.token
            state.user = payload.user
        },
        destroyStorage(state){
            state.token = null
            state.user = null
        },
        setProfilePhoto(state, payload){
            state.user = payload
        }
    },
    getters:{
        loggedIn(state){
            return state.token !== null
        },
        loggedInAsGuest(state){
            let user = JSON.parse(state.user);
            return (state.token !== null && user.role.id==4)
        },
        isLoading(state){
            return state.loading
        },
        userDetails(state){
            return JSON.parse(state.user);
        }
    },
    actions :{
        updateProfilePictureAction(context, data){
            let user = JSON.parse(localStorage.getItem('user'));
            user.thumbnail = data.thumbnail;
            user.image = data.image;
            localStorage.setItem("user", JSON.stringify(user));
            store.commit('setProfilePhoto', JSON.stringify(user))
        },
        setRoutesAction(context,user){
            let data = user;
            //console.log(data);
            store.dispatch('formatRoutesAction',data.role.role_routes).then((response) => {
                router.addRoutes(response);
            })
        },
        formatRoutesAction(context,arr){
            //return arr;
            return arr.map((obj) => {
                let src = obj.component;
                obj.component = () => import(`../${src}`);
                //obj.component = () => import('../containers/DefaultContainer');
                if (typeof (obj.children) != 'undefined') {
                    //this.formatRoutes(obj.children);
                    store.dispatch('formatRoutesAction',obj.children);
                }
                return obj;
            });
        },
        logInActionUsingToken(context, response){
            return new Promise((resolve,reject)=>{
                const token = response.token;
                const user = JSON.stringify(response.user)

                localStorage.setItem('user',user)
                localStorage.setItem('token',token)
                context.commit('retrieveStorage',{token:token,user:user})

                axios.defaults.headers.common['Authorization']= 'Bearer '+token;
                const reformattedRoutes = store.dispatch('setRoutesAction',JSON.parse(user))
                resolve(reformattedRoutes)
            })
        },
        logInAction(context, credentials){
            return new Promise((resolve,reject)=>{
                axios.post('oauth/token',credentials).then((response) => {
                    const token = response.data.access_token
                    const user = JSON.stringify(response.data.user)

                    localStorage.setItem('user',user)
                    localStorage.setItem('token',token)
                    context.commit('retrieveStorage',{token:token,user:user})

                    axios.defaults.headers.common['Authorization']= 'Bearer '+token;
                    const reformattedRoutes = store.dispatch('setRoutesAction',JSON.parse(user))
                    resolve(reformattedRoutes)
                })
                .catch(error => {
                    reject(error)
                });
            })
        },
        logOutAction(context){
            return new Promise((resolve,reject)=>{
                if(context.getters.loggedIn) {
                    localStorage.removeItem('token')
                    localStorage.removeItem('user')
                    context.commit('destroyStorage')
                    resolve()
                }else{
                    reject(error)
                }
            })
        }
    }
})
