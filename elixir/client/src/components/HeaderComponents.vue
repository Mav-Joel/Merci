<template>
  <div id="app">
    <v-card id="lateral">
      <v-toolbar dark tabs flat color="indigo">
        <v-app-bar-nav-icon></v-app-bar-nav-icon>
        <v-tab @click="goToHome()">
          <v-toolbar-title>Working Time</v-toolbar-title></v-tab
        >
        <v-spacer></v-spacer>
        <v-btn icon>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>
        <v-btn icon>
          <v-icon>mdi-dots-vertical</v-icon>
        </v-btn>
        <template v-slot:extension>
          <v-tabs v-model="tabs" align-with-title>
            <v-tab v-if="hidden_1" @click="goToLogin()"> Login </v-tab>
            <v-tab v-if="hidden_1" @click="goToRegister()"> Register </v-tab>
            <v-tab v-if="hidden" @click="goToProfil()"> My Collabarators </v-tab>
            <v-tab v-if="hidden" @click="goToAdmin()"> {{name}} </v-tab>
            <v-tab v-if="hidden" @click="LogOut()"> LogOut </v-tab>
            <v-tabs-slider color="pink"></v-tabs-slider>
          </v-tabs>
        </template>
      </v-toolbar>
    </v-card>
  </div>
</template>
<script>
import router from "@/router";
import axios from "axios";

export default {
  data: () => ({
    fab: false,
    hidden: false,
    hidden_1: true,
    tabs: null,
    name: localStorage.name,
    token: false,
  }),
  mounted() {
    const token = localStorage.token;
    if (token) {
      this.hidden = true;
      this.hidden_1 = false;
    }
  },
  methods: {
    goToLogin() {
      this.$router.push("/login");
    },
    goToRegister() {
      this.$router.push("/register");
    },
    goToHome() {
      this.$router.push("/home/:id");
    },
    goToProfil() {
      this.$router.push("/mycollaborators/:id");
    },
    goToAdmin() {
      this.$router.push("/adminpage/:id").catch(() => {});
    },

    LogOut() {
      axios.post('http://localhost:4000/api/users/logout').then(({ data }) => {
        console.log(data)
        localStorage.removeItem('token');
        localStorage.removeItem('id');
        localStorage.removeItem('username');

        router.push("/");

      }).catch(function (error) {
        console.log(error.toJSON());
      });

    }

  },
    
};
</script>
<style>
/* This is for documentation purposes and will not be needed in your application */
#lateral .v-btn--example {
  bottom: 0;
  position: absolute;
  margin: 0 0 16px 16px;
}
</style>
