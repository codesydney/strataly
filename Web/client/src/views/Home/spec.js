import { shallowMount } from '@vue/test-utils'
import Home from './Index.vue'

describe('Home component', () => {
  it('renders test message', () => {
    const msg = 'This is the home page'
    const wrapper = shallowMount(Home)

    expect(wrapper.text()).toMatch(msg)
  })
})
