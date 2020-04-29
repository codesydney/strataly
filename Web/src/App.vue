<script>
import './App.scss'
import Navbar from '@/components/Navbar/Index.vue'

export default {
  name: 'App',
  components: {
    Navbar
  }
}
</script>

<template>
  <div id="app">
    <Navbar />
    <router-view />
  </div>
</template>
