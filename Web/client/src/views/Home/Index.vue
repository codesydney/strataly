<script>
import { mapState } from 'vuex'
import './style.scss'
import skyline from '@/assets/img/city.png'
import logo from '../../assets/img/strataly-logo.svg'

export default {
  name: 'Home',
  data() {
    return {
      skyline,
      logo
    }
  },
  computed: {
    ...mapState(['isMobile'])
  }
}
</script>

<template>
  <div class="home">
    <div v-if="isMobile" class="top-empty-overlay">
      <div class="container top-empty-div">
        <img class="logo" :src="logo" />
      </div>

      <img v-if="isMobile" :src="skyline" class="skyline-image" />
    </div>

    <h1>Store {{ isMobile }}</h1>

    <p v-if="isMobile">I'm only visible on Mobile phones ;)</p>
  </div>
</template>
