<template>
  <div id="app">
    <v-card-text class="text-center">
      <router-link to="/MyWorkingTimes">
        <v-btn text> My Workingtimes </v-btn>
      </router-link>
      <router-link to="/">
        <v-divider class="mx-4" vertical></v-divider>
        <v-btn text> My TimeManager </v-btn>
      </router-link>
    </v-card-text>

    <MyCards />
    <Timer />
    <BarWeek />
  </div>
</template>

<script>
import BarWeek from "./BarWeek.vue";
import MyCards from "./MyCards.vue";
import Timer from "./Timer.vue";
export default {
  name: "HomeView",
  components: {
    MyCards,
    BarWeek,
    Timer,
  },
};
</script>
