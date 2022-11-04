<template>
  <div id="app">
    <v-app id="inspire">
      <v-content>
        <v-container fluid fill-height>
          <v-layout align-center justify-center>
            <v-flex xs12 sm8 md4>
              <v-card class="elevation-12">
                <v-toolbar dark color="primary">
                  <v-toolbar-title>Login form </v-toolbar-title>
                </v-toolbar>
                <v-card-text>
                  <v-form>
                    <v-text-field v-model="email" name="Email" label="Email" type="text">
                    </v-text-field>
                    <v-text-field
                      id="password"
                      name="password"
                      label="Password"
                      v-model="password"
                      type="password"
                    ></v-text-field>
                  </v-form>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn v-on:click="postLogin" color="primary">Login</v-btn>
                </v-card-actions>
              </v-card>
            </v-flex>
          </v-layout>
        </v-container>
      </v-content>
    </v-app>
  </div>
</template>

<script>

import router from "@/router";
import axios from "axios";

export default {
  data() {
    return {
      email: this.email,
      password: this.password,
      hidden: false
    };
  },

  methods: {
    postLogin() {
      console.log(this.email);
      console.log(this.password);
      
      axios.post('http://localhost:4000/api/users/login', {
        email: this.email,
        password: this.password,
      }).then(({ data }) => {
        console.log(data)
        localStorage.token = data.access_token;
        localStorage.id = data.userId;
        localStorage.name = data.username;

        router.push("/");

      }).catch(function (error) {
        console.log(error.toJSON());
      });

    }
  }

};
</script>