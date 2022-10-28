<template>
  <div class="home">
    <CalendarComponents msg="Welcome to Your Vue.js App" />
    <FooterPage />
  </div>
</template>

<script>
// @ is an alias to /src
import CalendarComponents from "@/components/CalendarComponents.vue";
import FooterPage from "@/components/FooterPage.vue";

export default {
  name: "HomeView",
  components: {
    CalendarComponents,
    FooterPage,
  },
};
</script>
