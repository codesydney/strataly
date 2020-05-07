<script>
import { mapState } from 'vuex'
import { validationMixin } from 'vuelidate'
import { required, email, minLength } from 'vuelidate/lib/validators'

export default {
  name: 'HomeLogin',
  mixins: [validationMixin],
  validations: {
    email: { required, email },
    password: { required, minLength: minLength(5) }
  },
  data() {
    return {
      email: '',
      password: '',
      clickedSubmit: false,
      validationState: 'invalid'
    }
  },
  computed: {
    emailErrors() {
      const errors = []
      if (!this.clickedSubmit) return [] // Return errors only when for is submitted
      if (!this.$v.email.$dirty) return errors //Return errors only when the field becomes dirty
      !this.$v.email.email && errors.push('Must be valid e-mail') //Push this error when the 'email' validation fails
      !this.$v.email.required && errors.push('E-mail is required')
      return errors
    },
    passwordErrors() {
      const errors = []
      if (!this.clickedSubmit) return []
      if (!this.$v.password.$dirty) return errors
      !this.$v.password.required && errors.push('Password is required')
      !this.$v.password.minLength && errors.push('Too Short!!!')
      return errors
    },

    ...mapState(['isMobile'])
  },
  methods: {
    login() {
      this.clickedSubmit = true
      if (this.$v.$invalid) console.log('Invalid form')
      else {
        console.log('Form is valid')
      }
    }
  }
}
</script>

<template>
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
              v-model="email"
              @input="$v.email.$touch()"
              @blur="$v.email.$touch()"
              :error-messages="emailErrors"
            ></v-text-field>
          </v-col> </v-row
        ><v-row justify="center" class="my-n6">
          <v-col cols="10" md="4">
            <v-text-field
              label="Password"
              required
              clearable
              outlined
              type="password"
              v-model="password"
              :dark="isMobile"
              @input="$v.password.$touch()"
              @blur="$v.password.$touch()"
              :error-messages="passwordErrors"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row justify="center">
          <v-col cols="10" md="4">
            <v-btn
              block
              @click="login"
              :disabled="$v.$invalid"
              large
              color="success"
              >Login</v-btn
            >
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-container>
</template>
