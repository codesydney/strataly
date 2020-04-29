<script>
import Navbar from '@/components/Navbar/Index.vue'

export default {
  name: 'App',
  components: {
    Navbar
  }
}
</script>

<template>
  <div class="app">
    <Navbar />
    <router-view />
  </div>
</template>
