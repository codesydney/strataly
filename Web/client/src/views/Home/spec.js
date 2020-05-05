import { mount, createLocalVue } from '@vue/test-utils'
import Vuetify from 'vuetify'
import Vue from 'vue'
Vue.use(Vuetify)
import Home from './Index.vue'
const localVue = createLocalVue()

describe('CustomCard.vue', () => {
  let vuetify

  beforeEach(() => {
    vuetify = new Vuetify()
  })

  it('should have a custom title and match snapshot', () => {
    const wrapper = mount(Home, {
      localVue,
      vuetify,
      mocks: {
        $vuetify: { breakpoint: {} }
      }
    })

    // With jest we can create snapshot files of the HTML output
    expect(wrapper.html()).toMatchSnapshot()
  })
})
