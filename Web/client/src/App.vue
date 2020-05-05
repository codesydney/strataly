<script>
import Navbar from '@/components/Navbar/Index.vue'
import './App.scss'

export default {
  name: 'App',
  components: {
    Navbar
  }
}
</script>

<template>
  <v-app>
    <Navbar />
    <v-content>
      <router-view />
    </v-content>
  </v-app>
</template>
