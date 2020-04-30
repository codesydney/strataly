import { shallowMount } from '@vue/test-utils'
import Home from './Index.vue'

describe('Home component', () => {
  it('renders test message', () => {
    const wrapper = shallowMount(Home)

    expect(wrapper.element).toMatchSnapshot()
  })
})
