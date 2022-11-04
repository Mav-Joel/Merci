<template>
  <div id="app">
    <MyCards />
    <BarWeek />
  </div>
</template>

<script>
import BarWeek from "./BarWeek.vue";
import MyCards from "./MyCards.vue";

// @ is an alias to /src
MyCards;
export default {
  name: "HomeView",
  components: {
    MyCards,
    BarWeek,
  },
};
</script>
