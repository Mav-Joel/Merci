import Vue from "vue";
import MyCollaborators from "../views/MyCollaborators.vue";
import VueRouter from "vue-router";
import HomeView from "../views/HomeView.vue";
import LoginPage from "../views/LoginPage.vue";
import registerPage from "../views/RegisterPage.vue";
// import FooterPage from "../views/FooterPage";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/login",
    name: "login",
    component: LoginPage,
  },
  {
    path: "/mycollaborators",
    name: "mycollaborators",
    component: MyCollaborators,
  },
  {
    path: "/register",
    name: "register",
    component: registerPage,
  },
];

const router = new VueRouter({
  routes,
});

export default router;
