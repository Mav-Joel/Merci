<template>
<div id="app">
  <v-app id="inspire">
    <v-content>
      <v-container fluid fill-height>
        <v-layout align-center justify-center>
          <v-flex xs12 sm8 md4>
            <v-card class="elevation-12">
              <v-toolbar dark color="primary">
                <v-toolbar-title>Register form</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-form>
                  <v-text-field v-model="email" name="Email" label="Email" type="text">
                  </v-text-field>
                  <v-text-field v-model="username" name="Username" label="Username" type="text">
                  </v-text-field>
                  <v-text-field
                    id="password"
                    name="password"
                    label="Password"
                    type="password"
                    v-model="password"
                  ></v-text-field>
                </v-form>
                <v-form>
                  <v-text-field
                    id="confirmpassword"
                    name="confirmpassword"
                    label="Confirm Password"
                    type="password"
                  ></v-text-field>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn text v-on:click="postRegister" color="primary" >Register</v-btn>
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

import axios from "axios";

export default {
  data() {
    return {
      email: this.email,
      username: this.username,
      password: this.password,
      role: "user",
      team: 1,
    };
  },

  methods: {
    postRegister() {
      
      axios.post('http://localhost:4000/api/users/register', {
        user: {
          email: this.email,
          username: this.username,
          password: this.password,
          team: 1
        }
      }).then(({ data }) => {
        console.log(data)
        localStorage.token = data.access_token;
        localStorage.id = data.userId;
        localStorage.name = data.username;

      }).catch(function (error) {
        console.log(error.toJSON());
      });

    }
  }

};
</script>

