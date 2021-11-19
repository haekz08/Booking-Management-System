<template>
  <div class="app">
    <div class="print-area" v-if="print">
      print area
    </div>
    <AppHeader fixed>
      <SidebarToggler class="d-lg-none" display="md" mobile/>
      <b-link class="navbar-brand" to="#">
        <img class="navbar-brand-full" :src="assets_path.MEDSAILING_ASSETS + '/logo.png'" width="89" height="25"
             alt="Medsailing Logo">
        <img class="navbar-brand-minimized" :src="assets_path.MEDSAILING_ASSETS + '/logo.png'" width="30" height="30"
             alt="Medsailing Logo">
      </b-link>
      <SidebarToggler class="d-md-down-none" display="lg" @click.native="closeSubMenuIcon"/>
      <!-- <b-navbar-nav class="d-md-down-none">
        <b-nav-item class="px-3" to="/dashboard">Dashboard</b-nav-item>
        <b-nav-item class="px-3" to="/users" exact>Users</b-nav-item>
        <b-nav-item class="px-3">Settings</b-nav-item>
      </b-navbar-nav> -->
      <b-navbar-nav class="ml-auto">
        <!-- <b-nav-item class="d-md-down-none">
          <i class="icon-bell"></i>
          <b-badge pill variant="danger">5</b-badge>
        </b-nav-item> -->
        <!-- <b-nav-item class="d-md-down-none">
          <i class="icon-list"></i>
        </b-nav-item>
        <b-nav-item class="d-md-down-none">
          <i class="icon-location-pin"></i>
        </b-nav-item> -->
        <DefaultHeaderDropdownAccnt/>
      </b-navbar-nav>
      <!-- <AsideToggler class="d-none d-lg-block" /> -->
      <!--<AsideToggler class="d-lg-none" mobile />-->
    </AppHeader>
    <div class="app-body">
      <AppSidebar>
        <!-- <b-row>
          <b-col md="12" class="text-center">
            <img alt="Med Sailing Logo" src="img/logo-symbol.png" class="menu-logo">
          </b-col>
        </b-row> -->

        <b-row class="main-menu-item" :class="(index==subMenuIndex ? 'active-menu' : '')" v-for="(menu,index) in menus"
               @click="generateSubMenu(menu,index)">
          <b-col md="12" class="m-0 px-1 text-center">
            <!-- <q-icon :name="menu.icon" style="font-size: 2rem;" /> -->
            <i :class="'fa fa-'+menu.icon" style="font-size: 1rem;"></i>
            <span class="main-menu-text">{{ menu.label }}</span>
          </b-col>
        </b-row>
      </AppSidebar>
      <transition name="slide-menu">
        <div class="sub-menu-holder" v-if="subMenuSlide">
          <h5 class="sub-menu-title">{{subMenus.label}}</h5>
          <!-- <q-icon name="clear" class="sub-menu-close float-right" @click.native="closeSubMenu"/> -->
          <i class="fa fa-times sub-menu-close float-right" @click="closeSubMenuIcon"></i>
          <div class="sub-menu-content-row">
            <div class="sub-menu-content-col">
              <div v-for="subMenu in subMenus.column1">
                <span class="sub-menu-content-col-title">{{subMenu.subLabel}}</span>
                <span class="sub-menu-content-col-list" v-for="child in subMenu.child"
                      @click="redirectFunction(child.path)"><i class="fa fa-angle-double-right fa-fw"></i>{{child.name}}</span>
              </div>
            </div>
            <div class="sub-menu-content-col" v-if="subMenus.column2">
              <div v-for="subMenu in subMenus.column2">
                <span class="sub-menu-content-col-title">{{subMenu.subLabel}}</span>
                <span class="sub-menu-content-col-list" v-for="child in subMenu.child"
                      @click="redirectFunction(child.path)"><i class="fa fa-angle-double-right fa-fw"></i>{{child.name}}</span>
              </div>
            </div>
            <div class="sub-menu-content-col" v-if="subMenus.column3">
              <div v-for="subMenu in subMenus.column3">
                <span class="sub-menu-content-col-title">{{subMenu.subLabel}}</span>
                <span class="sub-menu-content-col-list" v-for="child in subMenu.child"
                      @click="redirectFunction(child.path)"><i class="fa fa-angle-double-right fa-fw"></i>{{child.name}}</span>
              </div>
            </div>
          </div>
        </div>
      </transition>
      <!-- <AppSidebar fixed>
        <SidebarHeader/>
        <SidebarForm/>
        <SidebarNav :navItems="nav"></SidebarNav>
        <SidebarFooter/>
        <SidebarMinimizer/>
      </AppSidebar> -->
      <main class="main">
        <Breadcrumb :list="list"/>
        <div class="container-fluid">
          <router-view></router-view>
        </div>
      </main>
      <AppAside fixed>
        <!--aside-->
        <DefaultAside/>
      </AppAside>
    </div>
    <TheFooter>
      <!--footer-->
      <div>
        <a href="#">Med Sailing Holidays</a>
        <span class="ml-1">&copy; 2020</span>
      </div>
      <div class="ml-auto">
        <!-- <span class="mr-1">Powered by</span>
        <a href="https://coreui.io">CoreUI for Vue</a> -->
      </div>
    </TheFooter>
  </div>
</template>

<script>
  import {bus} from '@/main.js';
  import nav from '@/_nav';
  import {assets_path} from '@/config';
  import {
    Header as AppHeader,
    SidebarToggler,
    Sidebar as AppSidebar,
    SidebarFooter,
    SidebarForm,
    SidebarHeader,
    SidebarMinimizer,
    SidebarNav,
    Aside as AppAside,
    AsideToggler,
    Footer as TheFooter,
    Breadcrumb
  } from '@coreui/vue'
  import DefaultAside from './DefaultAside'
  import DefaultHeaderDropdownAccnt from './DefaultHeaderDropdownAccnt'

  export default {
    name: 'MainContainer',
    components: {
      AsideToggler,
      AppHeader,
      AppSidebar,
      AppAside,
      TheFooter,
      Breadcrumb,
      DefaultAside,
      DefaultHeaderDropdownAccnt,
      SidebarForm,
      SidebarFooter,
      SidebarToggler,
      SidebarHeader,
      SidebarNav,
      SidebarMinimizer
    },
    data() {
      return {
        nav: nav.items,
        menus: [
          {label: 'DASHBOARD', icon: 'dashboard'},
        ],
        guest_menu: [
          {label: 'DASHBOARD', icon: 'dashboard'},
          {
            label: 'BOOKINGS',
            icon: 'globe',
            column1: [
              {
                subLabel: 'Bookings',
                child: [
                  {name: 'Booked', path: '/bookings'}
                ]
              }
            ]
          }
        ],
        admin_menu: [
          {label: 'DASHBOARD', icon: 'dashboard'},
          {
            label: 'SETTINGS', icon: 'cogs',
            column1: [
              {
                subLabel: 'General Settings',
                child: [
                  {name: 'Guest Titles', path: '/guest-titles'},
                  {name: 'Nationalities', path: '/nationalities'},
                  {name: 'Payment Types', path: '/payment-types'},
                  {name: 'ID Types', path: '/identification-card-types'},
                  {name: 'Site Settings', path: '/general-settings'},
                  {name: 'Diet Options', path: '/diet-options'},
                  {name: 'Gender', path: '/gender'},
                  {name: 'Lead Sources', path: '/lead-sources'}
                ]
              },
              {
                subLabel: 'Itinerary Settings',
                child: [
                  {name: 'Itinerary Brands', path: '/itinerary-brands'},
                  {name: 'Itinerary Countries', path: '/itinerary-countries'},
                  {name: 'Ports & Cities', path: '/itinerary-cities'},
                  {name: 'Inclusions List', path: '/inclusions'},
                  {name: 'Exclusions List', path: '/exclusions'},
                  {name: 'Add Ons List', path: '/add-ons'}
                ]
              }
            ],
            column2: [
              {
                subLabel: 'Boat Settings',
                child: [
                  {name: 'Boat Models', path: '/boat-models'},
                  {name: 'Boat Types', path: '/boat-types'},
                  {name: 'Boat Brands', path: '/boat-brands'},
                  {name: 'Boat List', path: '/boats'},
                  {name: 'Boat Ambassadors', path: '/boat-ambassadors'},
                  {name: 'Cabin Types', path: '/cabin-types'}
                ]
              },
              {
                subLabel: 'Crew Settings',
                child: [
                  {name: 'Crew Types', path: '/crew-types'},
                  {name: 'Crew List', path: '/boat-crews'}
                ]
              }
            ]
          },
          {
            label: 'ITINERARIES',
            icon: 'map',
            column1: [
              {
                subLabel: 'Itineraries',
                child: [
                  {name: 'CREATE New Itinerary', path: '/itineraries/create'},
                  {name: 'VIEW Itineraries', path: '/itineraries'},
                ]
              }
            ]
          },
          {
            label: 'BOOKINGS',
            icon: 'globe',
            column1: [
              {
                subLabel: 'Bookings',
                child: [
                  {name: 'VIEW Bookings', path: '/bookings'},
                  // {name: 'Request Refund', path: '/refund'}
                ]
              }
            ]
          },
          {
            label: 'REPORTS',
            icon: 'folder-open',
            column1: [
              {
                subLabel: 'Reports',
                child: [
                  {name: 'Master List', path: '/master-list'},
                ]
              }
            ]
          },
          {
            label: 'GALLERY', icon: 'image',
            column1: [
              {
                subLabel: 'Gallery',
                child: [
                  {name: 'Gallery', path: '/galleries'},
                ]
              }
            ]
          },
          // { label: 'USERS',icon:'group'},
          {
            label: 'ADMIN', icon: 'steam',
            column1: [
              {
                subLabel: 'Route Settings',
                child: [
                  {name: 'System Routes', path: '/system-routes'},
                ]
              }
            ]
          }
        ],
        leftDrawerOpen: false,
        subMenuSlide: false,
        subMenus: [],
        subMenuIndex: -1,
        print: false,
        assets_path: {}
      }
    },
    computed: {
      name() {
        return this.$route.name
      },
      list() {
        //console.log(this.$route);
        return this.$route.matched.filter((route) => route.name || route.meta.label)
      }
    },
    created() {
      this.assets_path = assets_path;
      bus.$on('triggerPrint', (print_data) => {
        this.print = true;
        //console.log(print_data);
      });
      let details = this.$store.getters.userDetails;
      details.role.id == 4 ? this.menus = this.guest_menu : this.menus = this.admin_menu;
    },
    methods: {

      generateSubMenu(menu, index) {
        if (this.subMenuIndex != index) {
          if (this.subMenuSlide) {
            this.subMenuSlide = false;
            setTimeout(() => {
              this.subMenus = menu;
              this.subMenuSlide = true;
            }, 300);
          } else {
            this.subMenus = menu;
            this.subMenuSlide = true;
          }

          this.subMenuIndex = index;
        } else {
          this.subMenuSlide = false;
          this.subMenuIndex = -1;
        }
      },
      closeSubMenu() {
        //const element = this.$el.querySelector("body");

        if (!document.body.classList.contains('sidebar-lg-show')) {
          this.subMenuIndex = -1;
          this.subMenuSlide = false;
        }

      },
      closeSubMenuIcon() {
        this.subMenuIndex = -1;
        this.subMenuSlide = false;
      },
      redirectFunction(path) {
        this.closeSubMenuIcon();
        this.$router.push(path)
      }
    }
  }
</script>
<style scoped>
  .slide-menu-enter-active, .slide-menu-leave-active {
    transition: all .3s;
  }

  .slide-menu-enter, .slide-menu-leave-to /* .fade-leave-active below version 2.1.8 */
  {
    opacity: 0;
    left: 0;
  }
</style>

