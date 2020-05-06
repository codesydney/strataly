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
  <div>
    <div class="top-empty-overlay d-sm-none">
      <div class="container top-empty-div">
        <img class="logo" :src="logo" />
      </div>

      <img :src="skyline" class="skyline-image" />
    </div>

    <v-container>
      <v-form>
        <v-container>
          <!-- <v-row justify="center">
            <p class="headline">Please Login</p>
          </v-row> -->
          <v-row justify="center">
            <v-col cols="10" md="4">
              <v-text-field
                label="Email"
                required
                clearable
                outlined
                :dark="isMobile"
              ></v-text-field>
            </v-col> </v-row
          ><v-row justify="center" class="my-n6">
            <v-col cols="10" md="4">
              <v-text-field
                label="Password"
                required
                clearable
                outlined
                :dark="isMobile"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row justify="center">
            <v-col cols="10" md="4">
              <v-btn block @click="login" large color="success">Login</v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </v-container>
  </div>
</template>
