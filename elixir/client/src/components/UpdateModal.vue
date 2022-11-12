<template>
  <div id="app">
    <div v-if="url === `/MyWorkingTimes`">
      <v-row justify="center">
        <v-dialog v-model="dialog" persistent max-width="600px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              class="mx-2"
              fab
              dark
              small
              color="cyan"
              v-on="on"
              v-bind="attrs"
            >
              <v-icon dark> mdi-pencil </v-icon>
            </v-btn>
          </template>
          <v-card>
            <v-container v-for="fuck in fuck.data" v-bind:key="fuck.id">
              <!-- <div v-if="fuck.id === id"> -->
              <v-card-title>
                <span class="text-h5">User Profile</span>
              </v-card-title>
              <v-card-text>
                <v-row>
                  <v-col cols="12">
                    <v-text-field
                      v-model="fuck.start"
                      label="Username*"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field
                      v-model="fuck.end"
                      label="Email*"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12">
                    <v-text-field
                      v-model="fuck.password"
                      label="Password*"
                      type="password"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12">
                    <v-text-field v-model="fuck.id" label="id*"> </v-text-field>
                  </v-col>
                </v-row>
                <small>*indicates required field</small>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text v-on:click="dialog = false">
                  Close
                </v-btn>
                <v-btn
                  color="blue darken-1"
                  text
                  v-on:click="editCustomer(fuck.id, fuck)"
                >
                  Save
                </v-btn>
              </v-card-actions>
              <!-- </div> -->
            </v-container>
          </v-card>
        </v-dialog>
      </v-row>
    </div>
    <div v-else>
      <v-row justify="center">
        <v-dialog v-model="dialog" persistent max-width="600px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn class="ma-1" color="green" v-on="on" v-bind="attrs" plain>
              Update
            </v-btn>
          </template>
          <v-card>
            <v-container v-for="fuck in fuck.data" v-bind:key="fuck.id">
              <!-- <div v-if="fuck.id === id"> -->
              <v-card-title>
                <span class="text-h5">User Profile</span>
              </v-card-title>
              <v-card-text>
                <v-row>
                  <v-col cols="12">
                    <v-text-field
                      v-model="fuck.username"
                      label="Username*"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12">
                    <v-text-field
                      v-model="fuck.email"
                      label="Email*"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12">
                    <v-text-field
                      v-model="fuck.password"
                      label="Password*"
                      type="password"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12">
                    <v-text-field v-model="fuck.id" label="id*"> </v-text-field>
                  </v-col>
                </v-row>

                <small>*indicates required field</small>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text v-on:click="dialog = false">
                  Close
                </v-btn>
                <v-btn
                  color="blue darken-1"
                  text
                  v-on:click="editCustomer(fuck.id, fuck)"
                >
                  Save
                </v-btn>
              </v-card-actions>
              <!-- </div> -->
            </v-container>
          </v-card>
        </v-dialog>
      </v-row>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      dialog: false,
      id: "",
      username: "",
      email: "",
      password: "",
      workingtimes: [],
      fuck: [],
      url: window.location.pathname,
    };
  },

  methods: {
    editCustomer(id, fuck) {
      console.log("1", id);
      const user = {
        user: {
          username: fuck.username,
          email: fuck.email,
          password: fuck.password,
          id: fuck.id,
        },
      };
      console.log("3", user);
      axios
        .put(`http://localhost:4000/api/users/${id}`, user)
        .then((response) => console.log(response.data));
    },
  },

  mounted() {
    axios
      .get("http://localhost:4000/api/users/")
      .then((response) => (this.fuck = response.data));
    console.log("4", this.fuck.data);
  },
};
</script>

<style>
.v-application .justify-center {
  margin-top: 5%;
}
</style>
