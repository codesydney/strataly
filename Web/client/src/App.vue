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
  <div id="app">
    <Navbar />
    <router-view />
  </div>
</template>
