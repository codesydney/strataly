import Vue from 'vue'
import Vuetify from 'vuetify/lib'

Vue.use(Vuetify)

const vuetify = new Vuetify({
  theme: {
    themes: {
      dark: {
        background: '#030303'
      }
    },
    options: {
      customProperties: true
    }
  }
})

export default vuetify
