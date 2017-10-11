import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/Main'
import Cars from '@/components/Cars'
import Register from '@/components/Register'
import Order from '@/components/Order'
import Orders from '@/components/Orders'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Main',
      component: Main
    },
    {
      path: '/cars/',
      name: 'Cars',
      component: Cars
    },
    {
      path: '/register/',
      name: 'Register',
      component: Register
    }
    ,
    {
      path: '/order/:obj',
      name: 'order',
      component: Order
    },
    {
      path: '/orders',
      name: 'Orders',
      component: Orders
    },


  ]
})
