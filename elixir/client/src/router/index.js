import Vue from "vue";
import MyCollaborators from "../components/MyCollaborators.vue";
import VueRouter from "vue-router";
import HomeView from "../components/HomeView.vue";
import LoginPage from "../components/LoginPage.vue";
import registerPage from "../components/RegisterPage.vue";
import MyProfileAdmin from "../components/MyProfileAdmin.vue";
// import FooterPage from "../views/FooterPage";

Vue.use(VueRouter);

const routes = [
  {
    path: "/home/:id",
    name: "home",
    component: HomeView,
  },
  {
    path: "/login",
    name: "login",
    component: LoginPage,
  },
  {
    path: "/",
    name: "beforeLog",
    component: LoginPage,
  },
  {
    path: "/mycollaborators/:id",
    name: "mycollaborators",
    component: MyCollaborators,
  },
  {
    path: "/register",
    name: "register",
    component: registerPage,
  },
  {
    path: "/adminpage/:id",
    name: "adminpage",
    component: MyProfileAdmin,
  },
];

const router = new VueRouter({
  mode: "history",
  routes,
});

export default router;
