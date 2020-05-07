import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home/Index.vue'
import About from '../views/About/Index.vue'
import RegisterNewUser from '../components/Forms/RegisterNewUser/Index.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about-us',
    name: 'About',
    component: About
  },
  {
    path: '/register-user',
    name: 'RegisterNewUser',
    component: RegisterNewUser
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
