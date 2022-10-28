<template>
  <div class="home">
    <CalendarComponents msg="Welcome to Your Vue.js App" />
  </div>
</template>

<script>
// @ is an alias to /src
import CalendarComponents from "@/components/CalendarComponents.vue";

export default {
  name: "HomeView",
  components: {
    CalendarComponents,
  },
};
</script>
