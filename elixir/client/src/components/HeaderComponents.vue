<template>
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
          <v-tab @click="goToLogin()"> Login </v-tab>
          <v-tab @click="goToRegister()"> Register </v-tab>
          <v-tab @click="goToProfil()"> My Collabarators </v-tab>
          <v-tab @click="goToAdmin()"> Admin </v-tab>
          <v-tabs-slider color="pink"></v-tabs-slider>
        </v-tabs>
      </template>
    </v-toolbar>
    <!-- <v-card-text>
      <v-tabs-items v-model="tabs">
        <v-tab-item
          v-for="content in ['one', 'two', 'three']"
          :key="content"
          :value="content"
        >
          <v-card height="200px" flat> </v-card>
        </v-tab-item>
      </v-tabs-items>
    </v-card-text> -->
    <!-- <v-fab-transition>
      <v-btn
        :key="activeFab.icon"
        :color="activeFab.color"
        fab
        large
        dark
        bottom
        left
        class="v-btn--example"
      >
        <v-icon>{{ activeFab.icon }}</v-icon>
      </v-btn>
    </v-fab-transition> -->
  </v-card>
</template>
<script>
export default {
  data: () => ({
    fab: false,
    hidden: false,
    tabs: null,
  }),

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
  },

  // computed: {
  //   activeFab() {
  //     switch (this.tabs) {
  //       case "one":
  //         return { color: "success", icon: "mdi-share-variant" };
  //       case "two":
  //         return { color: "red", icon: "mdi-pencil" };
  //       case "three":
  //         return { color: "green", icon: "mdi-chevron-up" };
  //       default:
  //         return {};
  //     }
  //   },
  // },
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
