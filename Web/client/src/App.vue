<script>
import Navbar from '@/components/Navbar/Index.vue'
//import Footer from '@/components/Footer/Index.vue'
import './App.scss'

export default {
  name: 'App',
  components: {
    Navbar
  },
  beforeDestroy() {
    if (typeof window !== 'undefined') {
      window.removeEventListener('resize', this.onResize, { passive: true })
    }
  },
  mounted() {
    this.onResize()
    window.addEventListener('resize', this.onResize, { passive: true })
  },
  methods: {
    onResize() {
      const value = (this.isMobile = window.innerWidth < 600)
      this.$vuetify.theme.dark = value
      this.$store.dispatch('updateIsMobile', value)
    }
  },
  computed: {
    dark() {
      return this.$store.state.isMobile
    }
  }
}
</script>

<template>
  <v-theme-provider root>
    <v-app>
      <Navbar />
      <v-content>
        <router-view />
      </v-content>
    </v-app>
  </v-theme-provider>
</template>
