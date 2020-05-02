<script>
import './style.scss'
import logo from '../../assets/img/strataly-logo.svg'

export default {
  name: 'Navbar',
  data() {
    return {
      drawer: false,
      dark: true,
      logo,
      navItems: [
        {
          title: 'Home',
          url: 'Home'
        },
        {
          title: 'About',
          url: 'About'
        }
      ]
    }
  }
}
</script>

<template>
  <div>
    <v-app-bar class="navbar" dense :dark="dark" app>
      <v-app-bar-nav-icon @click="drawer = true" v-show="$vuetify.breakpoint.xsOnly"></v-app-bar-nav-icon>

      <img class="nav-logo" :src="logo" />

      <v-toolbar-items class="hidden-xs-only" v-show="!$vuetify.breakpoint.xsOnly">
        <v-btn
          text
          v-for="item in navItems"
          :key="item.title"
          :to="{ name: item.url }"
          exact
          class="mr-5"
        >{{ item.title }}</v-btn>
      </v-toolbar-items>
      <v-spacer></v-spacer>
    </v-app-bar>

    <v-navigation-drawer
      absolute
      app
      v-model="drawer"
      temporary
      deep-purple
      accent-4
      dense
      :dark="dark"
    >
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="title text-center">Strataly</v-list-item-title>
          <v-list-item-subtitle class="text-center">CodeSydney</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list nav>
        <v-list-item
          v-for="(item, index) in navItems"
          :key="index"
          :to="{ name: item.url }"
          exact
          link
        >
          <v-list-item-content>
            <v-list-item-title class="text-center subtitle-2">{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>
