<script>
import { mapState } from 'vuex'
import './style.scss'
import skyline from '@/assets/img/city.png'
import logo from '../../assets/img/strataly-logo.svg'
import HomeLogin from '@/components/Forms/HomeLogin/Index.vue'

export default {
  name: 'Home',
  components: { HomeLogin },
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
  <div>
    <div class="top-empty-overlay d-sm-none">
      <div class="container top-empty-div">
        <img class="logo" :src="logo" />
      </div>

      <img :src="skyline" class="skyline-image" />
    </div>
    <HomeLogin />
  </div>
</template>
