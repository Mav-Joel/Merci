<template>
  <div id="app">
    <div v-if="url === `/MyWorkingTimes`">
      <v-row justify="center">
        <v-dialog v-model="dialog" persistent max-width="600px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn class="mx-2" fab dark small color="cyan" v-on="on" v-bind="attrs">
              <v-icon dark> mdi-pencil </v-icon>
            </v-btn>
          </template>
          <v-card>
            <v-container v-for="workingtime in workingtimes.data" v-bind:key="workingtime.id">
              <div v-if="workingtime.id === identifier">
                <v-card-title>
                  <span class="text-h5">Workingtime</span>
                </v-card-title>
                <v-card-text>
                  <v-row>
                    <v-col cols="12">
                      <v-text-field v-model="workingtime.start" label="Start*"></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field v-model="workingtime.end" label="End*"></v-text-field>
                    </v-col>
                  </v-row>
                  <small>*indicates required field</small>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text v-on:click="dialog = false">
                    Close
                  </v-btn>
                  <v-btn color="blue darken-1" text v-on:click="editWorkingTime(workingtime.id, workingtime)">
                    Save
                  </v-btn>
                </v-card-actions>
              </div>
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
              <div v-if="fuck.id === identifier">
                <v-card-title>
                  <span class="text-h5">User Profile</span>
                </v-card-title>
                <v-card-text>
                  <v-row>
                    <v-col cols="12">
                      <v-text-field v-model="fuck.username" label="Username*"></v-text-field>
                    </v-col>

                    <v-col cols="12">
                      <v-text-field v-model="fuck.email" label="Email*"></v-text-field>
                    </v-col>

                    <v-col cols="12">
                      <v-text-field v-model="fuck.password" label="Password*" type="password"></v-text-field>
                    </v-col>

                    <v-col cols="12">
                      <v-text-field v-model="fuck.id" label="id*">
                      </v-text-field>
                    </v-col>

                    <v-col cols="12">
                      <v-text-field v-model="fuck.team" label="team*">
                      </v-text-field>
                    </v-col>
                  </v-row>

                  <small>*indicates required field</small>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text v-on:click="dialog = false">
                    Close
                  </v-btn>
                  <v-btn color="blue darken-1" text v-on:click="editCustomer(fuck.id, fuck)">
                    Save
                  </v-btn>
                </v-card-actions>
              </div>
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
  props: ["identifier"],

  data() {
    return {
      dialog: false,
      id: "",
      username: "",
      email: "",
      password: "",
      team: "",
      workingtimes: [],
      fuck: [],
      url: window.location.pathname,
    };
  },

  methods: {
    editWorkingTime(id, worktime) {
      const headers = {
        Authorization: `Bearer ${localStorage.token}`,
      };
      const workingtime = {
        workingtimes: {
          start: worktime.start,
          end: worktime.end,
        },
      };

      axios
        .put(`http://18.233.170.155:4000/api/workingtimes/${id}`, workingtime, {
          headers,
        })
        .then((response) => console.log(response.data));
    },

    editCustomer(id, fuck) {
      const headers = {
        Authorization: `Bearer ${localStorage.token}`,
      };
      const user = {
        user: {
          username: fuck.username,
          email: fuck.email,
          password: fuck.password,
          team: fuck.team,
        },
      };

      axios
        .put(`http://18.233.170.155:4000/api/users/${id}`, user, { headers })
        .then((response) => console.log(response.data));
    },
  },

  mounted() {
    const headers = {
      Authorization: `Bearer ${localStorage.token}`,
    };

    axios
      .get("http://18.233.170.155:4000/api/users/")
      .then((response) => (this.fuck = response.data));

    axios
      .get("http://18.233.170.155:4000/api/workingtimes/", { headers })
      .then((response) => (this.workingtimes = response.data));
  },
};
</script>

<style>
.v-application .justify-center {
  margin-top: 5%;
}
</style>
