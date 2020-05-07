<script>
import { mapState } from 'vuex'
import { validationMixin } from 'vuelidate'
import {
  required,
  email,
  minLength,
  alpha,
  numeric,
  alphaNum,
  sameAs
} from 'vuelidate/lib/validators'

export default {
  name: 'RegisterNewUser',
  mixins: [validationMixin],
  data() {
    return {
      email: '',
      password: '',
      confirmPassword: '',
      name: '',
      unit: '',
      selectRoles: ['Role-1', 'Role-2', 'Role-3'],
      selectedRole: null,
      phone: null,
      clickedSubmit: false
    }
  },
  validations: {
    email: { required, email },
    password: { required, minLength: minLength(5) },
    confirmPassword: { required, sameAsPassword: sameAs('password') },
    name: { required, alpha, minLength: minLength(3) },
    unit: { required, alphaNum },
    selectedRole: { required },
    phone: { required, numeric, minLength: minLength(10) }
  },

  computed: {
    emailErrors() {
      const errors = []
      //if (!this.clickedSubmit) return [] // Return errors only when for is submitted
      if (!this.$v.email.$dirty) return errors //Return errors only when the field becomes dirty
      !this.$v.email.email && errors.push('Must be valid e-mail') //Push this error when the 'email' validation fails
      !this.$v.email.required && errors.push('E-mail is required')
      return errors
    },
    passwordErrors() {
      const errors = []
      //if (!this.clickedSubmit) return []
      if (!this.$v.password.$dirty) return errors
      !this.$v.password.required && errors.push('Password is required')
      !this.$v.password.minLength && errors.push('Too Short!!!')
      return errors
    },
    confirmPasswordErrors() {
      const errors = []
      //if (!this.clickedSubmit) return []
      if (!this.$v.confirmPassword.$dirty) return errors
      !this.$v.confirmPassword.required &&
        errors.push('Please re-enter password')
      !this.$v.confirmPassword.sameAsPassword &&
        errors.push('The passwords must match')
      return errors
    },
    nameErrors() {
      const errors = []
      //if (!this.clickedSubmit) return []
      if (!this.$v.name.$dirty) return errors
      !this.$v.name.alpha && errors.push('Name must only contain alphabets')
      !this.$v.name.minLength &&
        errors.push('Name must contain at least three characters')
      !this.$v.name.required && errors.push('Name is required')
      return errors
    },
    unitErrors() {
      const errors = []
      //if (!this.clickedSubmit) return []
      if (!this.$v.unit.$dirty) return errors
      !this.$v.unit.alphaNum && errors.push('Please enter valid unit number')
      !this.$v.unit.required && errors.push('Unit Number is required')
      return errors
    },
    roleErrors() {
      const errors = []
      //if (!this.clickedSubmit) return []
      if (!this.$v.selectedRole.$dirty) return errors
      !this.$v.selectedRole.required && errors.push('Please select a role')
      return errors
    },
    phoneErrors() {
      const errors = []
      //if (!this.clickedSubmit) return []
      if (!this.$v.phone.$dirty) return errors
      !this.$v.phone.numeric && errors.push('Must only contain numbers')
      !this.$v.phone.minLength && errors.push('Must contain at least 10 digits')
      !this.$v.phone.required && errors.push('Phone Number is required')
      return errors
    },
    ...mapState(['isMobile'])
  },
  methods: {
    register() {
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
        <v-row justify="center">
          <p class="headline">Add a new user</p>
        </v-row>
        <v-row justify="center">
          <v-col cols="10" md="4">
            <v-text-field
              label="Name"
              clearable
              outlined
              :dark="isMobile"
              v-model="name"
              @input="$v.name.$touch()"
              @blur="$v.name.$touch()"
              :error-messages="nameErrors"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row justify="center" class="my-n6">
          <v-col cols="10" md="4">
            <v-text-field
              label="Email"
              clearable
              outlined
              :dark="isMobile"
              v-model="email"
              @input="$v.email.$touch()"
              @blur="$v.email.$touch()"
              :error-messages="emailErrors"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row justify="center" class="my-n6">
          <v-col cols="10" md="4">
            <v-text-field
              label="Password"
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

        <v-row justify="center" class="my-n6">
          <v-col cols="10" md="4">
            <v-text-field
              label="Confirm Password"
              clearable
              outlined
              type="password"
              v-model="confirmPassword"
              :dark="isMobile"
              @input="$v.confirmPassword.$touch()"
              @blur="$v.confirmPassword.$touch()"
              :error-messages="confirmPasswordErrors"
            ></v-text-field>
          </v-col>
        </v-row>

        <v-row justify="center" class="my-n6">
          <v-col cols="10" md="4">
            <v-text-field
              label="Phone"
              clearable
              outlined
              v-model="phone"
              :dark="isMobile"
              @input="$v.phone.$touch()"
              @blur="$v.phone.$touch()"
              :error-messages="phoneErrors"
            ></v-text-field>
          </v-col>
        </v-row>

        <v-row justify="center" class="my-n6">
          <v-col cols="10" md="4">
            <v-text-field
              label="Unit"
              clearable
              outlined
              v-model="unit"
              :dark="isMobile"
              @input="$v.unit.$touch()"
              @blur="$v.unit.$touch()"
              :error-messages="unitErrors"
            ></v-text-field>
          </v-col>
        </v-row>

        <v-row justify="center" class="my-n6">
          <v-col cols="10" md="4">
            <v-select
              v-model="selectedRole"
              :items="selectRoles"
              :error-messages="roleErrors"
              label="User Role"
              outlined
              @change="$v.selectedRole.$touch()"
              @blur="$v.selectedRole.$touch()"
            ></v-select>
          </v-col>
        </v-row>

        <v-row justify="center">
          <v-col cols="10" md="4">
            <v-btn
              block
              @click="register"
              :disabled="$v.$invalid"
              large
              color="success"
              >Register</v-btn
            >
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-container>
</template>
