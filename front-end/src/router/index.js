import Vue from 'vue'
import Router from 'vue-router'

// Containers
const DefaultContainer = () => import('@/containers/DefaultContainer')
const BookingContainer = () => import('@/containers/BookingContainer')

// Views
const Dashboard = () => import('@/views/Dashboard')

// Views - Pages
const Login = () => import('@/views/pages/Login')
const PasswordReset = () => import('@/views/pages/PasswordReset')
const Page404 = () => import('@/views/pages/Page404')
const BookingIndex = () => import('@/views/pages/booking/Index')
const BrandItineraries = () => import('@/views/pages/booking/BrandItineraries')
const Book = () => import('@/views/pages/booking/Book')
const ThankYou = () => import('@/views/pages/booking/ThankYou')
Vue.use(Router)

export default new Router({
  base:'/',
  mode: 'history', // https://router.vuejs.org/api/#mode
  linkActiveClass: 'open active',
  scrollBehavior: () => ({ y: 0 }),
  routes: [
    // {
    //   path: '/',
    //   redirect: '/dashboard',
    //   name: 'Home',
    //   component: DefaultContainer,
    //   children: [
    //     {
    //       path: 'dashboard',
    //       name: 'Dashboard',
    //       component: Dashboard
    //     }
    //   ],
    //   meta: {
    //       requiresLogin:true
    //   }
    // },
    {
      path: '/',
      redirect: '/booking',
      name: 'BookingContainer',
      component: BookingContainer,
      children: [
        {
            path: '/booking',
            name: 'BookingIndex',
            component: BookingIndex
        },
        {
            path: '/booking/:country_slug/:brand_slug',
            name: 'BrandItineraries',
            component: BrandItineraries
        },
        {
            path: '/book-now',
            name: 'Book',
            component: Book
        },
        {
          path: '/thank-you/:id',
          name: 'ThankYou',
          props: true,
          component: ThankYou
        }
      ],
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/password-reset/:reset_token',
      name: 'PasswordReset',
      component: PasswordReset
    },
    {
      path: '/404',
      name: '404',
      component: Page404
    }
  ]
})
