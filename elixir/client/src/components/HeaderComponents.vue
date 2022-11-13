<template>
  <div id="app">
    <v-card id="lateral">
      <v-toolbar dark tabs flat color="indigo">
        <v-app-bar-nav-icon></v-app-bar-nav-icon>
        <v-tab> <v-toolbar-title>Working Time</v-toolbar-title></v-tab>
        <v-spacer></v-spacer>
        <v-btn icon>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>
        <v-btn icon>
          <v-icon>mdi-dots-vertical</v-icon>
        </v-btn>
        <template v-slot:extension>
          <keep-alive>
            <v-tabs v-model="tabs" align-with-title>
              <v-tab v-if="hidden_1" @click="goToLogin()"> Login </v-tab>
              <v-tab v-if="hidden_1" @click="goToRegister()"> Register </v-tab>
              <v-tab v-if="hidden" @click="goToHome()"> My TimeManager </v-tab>
              <v-tab v-if="hidden" @click="goToProfil()">
                My Collabarators
              </v-tab>
              <div class="admin">
                <v-tab v-if="hidden" @click="goToAdmin()">
                  {{ name }}
                </v-tab>
              </div>
              <v-tab v-if="hidden" @click="LogOut()"> LogOut </v-tab>
              <v-tabs-slider color="pink"></v-tabs-slider>
            </v-tabs>
          </keep-alive>
        </template>
      </v-toolbar>
    </v-card>
  </div>
</template>
<script>
import axios from "axios";

export default {
  data: () => ({
    fab: false,
    hidden: false,
    hidden_1: true,
    tabs: null,
    name: localStorage.name,
    token: localStorage.token,
    id: localStorage.id,
    role: localStorage.role,
  }),
  mounted() {
    const token = localStorage.token;
    if (token) {
      this.hidden = true;
      this.hidden_1 = false;
    }

    const role = localStorage.role;
    if (role === "user") {
      document.querySelector(".admin").style.display = "none";
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
      this.$router.push("/");
    },
    goToProfil() {
      this.$router.push("/mycollaborators");
    },
    goToAdmin() {
      this.$router.push("/adminpage").catch(() => {});
    },

    LogOut() {
      axios({
        method: "post",
        url: `http://localhost:4000/api/users/logout`,
        format: "json",
        headers: {
          Authorization: `Bearer ${localStorage.token}`,
        },
      }).then(({ data }) => {
        console.log(data);
      });
      window.localStorage.clear();
      window.localStorage.removeItem("name", "id", "token");
      this.hidden_1 = true;
      this.hidden = false;
      this.$router.push("/login");
    },
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
