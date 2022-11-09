<template>
  <div id="app">
    <header>
      <HeaderComponents />
    </header>

    <router-view> </router-view>
    <FooterPage />
  </div>
</template>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
<script>
import HeaderComponents from "@/components/HeaderComponents.vue";
import FooterPage from "@/components/FooterPage.vue";

export default {
  name: "HomeView",
  components: {
    HeaderComponents,
    FooterPage,
  },
};
</script>
