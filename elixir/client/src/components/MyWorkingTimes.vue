<template>
  <div id="app">
    <v-card-text class="text-center">
      <router-link to="/MyWorkingTimes">
        <v-divider class="mx-4" vertical></v-divider>
        <v-btn text> My WorkingTimes </v-btn>
      </router-link>
      <router-link to="/">
        <v-btn text> My TimeManager </v-btn>
      </router-link>
    </v-card-text>

    <MyCards />
  </div>
</template>

<script>
import MyCards from "./MyCards.vue";
export default {
  name: "HomeView",
  components: {
    MyCards,
  },
};
</script>

<style></style>
