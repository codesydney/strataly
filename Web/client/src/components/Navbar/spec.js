import { mount, createLocalVue } from '@vue/test-utils'
import Vuetify from 'vuetify'
import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(Vuetify)
import Navbar from './Index.vue'

const localVue = createLocalVue()

localVue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home'
    // component: Home
  },
  {
    path: '/about-us',
    name: 'About'
    // component: About
  }
]

const router = new VueRouter({ routes })

describe('CustomCard.vue', () => {
  let vuetify

  beforeEach(() => {
    vuetify = new Vuetify()
  })

  it('should have a custom title and match snapshot', () => {
    const wrapper = mount(Navbar, {
      localVue,
      vuetify,
      router,
      mocks: {
        $vuetify: { breakpoint: {} }
      }
    })

    // With jest we can create snapshot files of the HTML output
    expect(wrapper.html()).toMatchSnapshot()
  })
})
