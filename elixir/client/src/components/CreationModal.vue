<template>
  <div v-if="url === `/MyWorkingTimes`">
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn margin-top="25%" color="primary" dark v-bind="attrs" v-on="on">
            Create MyWorkingTimes
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">User Profile</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-text-field
                    id="start"
                    v-model="start"
                    label="Start*"
                    type="start"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    id="end"
                    v-model="end"
                    label="End*"
                    type="end"
                    required
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>
            <small>*indicates required field</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text v-on:click="dialog = false">
              Close
            </v-btn>
            <v-btn color="blue darken-1" text v-on:click="postWorkingTime()">
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>

  <div v-else-if="url === `/mycollaborators`">
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            id="button"
            margin-top="25%"
            color="primary"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Create team
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">Team</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-text-field
                    id="name"
                    v-model="name"
                    label="name*"
                    type="name"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12"> </v-col>
              </v-row>
            </v-container>
            <small>*indicates required field</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text v-on:click="dialog = false">
              Close
            </v-btn>
            <v-btn color="blue darken-1" text v-on:click="postTeam()">
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
  <div v-else>
    <v-row justify="center">
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn margin-top="25%" color="primary" dark v-bind="attrs" v-on="on">
            Create User
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">User Profile</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-text-field
                    id="username"
                    v-model="username"
                    label="Username*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    id="email"
                    v-model="email"
                    label="Email*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    id="password"
                    v-model="password"
                    label="Password*"
                    type="password"
                    required
                  >
                  </v-text-field>
                </v-col>
              </v-row>
            </v-container>
            <small>*indicates required field</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text v-on:click="dialog = false">
              Close
            </v-btn>
            <v-btn color="blue darken-1" text v-on:click="User()"> Save </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      dialog: false,
      username: "",
      email: "",
      password: "",
      id: "",
      url: window.location.pathname,
      start: "",
      end: "",
      user: "",
      name: "",
    };
  },

  mounted() {
    const role = localStorage.role;
    if (role === "user") {
      document.querySelector("#button").style.display = "none";
    }
  },

  methods: {
    async User() {
      const user = {
        user: {
          username: this.username,
          email: this.email,
          password: this.password,
        },
      };
      await axios
        .post("http://localhost:4000/api/users/register", user)
        .then((data) => {
          this.message = data.data.message;
          this.errorCredentials = false;
          window.location.reload();
          setTimeout(() => {
            this.sendAlert();
          }, 2500);
        })
        /* eslint-disable */
        .catch((error) => {
          this.errorCredentials = true;
        });
    },

    async postTeam() {
      const teams = {
        team: {
          name: this.name,
        },
      };

      await axios
        .post("http://localhost:4000/api/team", teams)
        .then((response) => {
          console.log(response);

          window.location.reload();
          setTimeout(() => {
            this.sendAlert();
          }, 2500);
        })
        /* eslint-disable */
        .catch((error) => {
          this.errorCredentials = true;
        });
    },
  },
  async postWorkingTime() {
    const user = localStorage.id;
    const workingtimes = {
      workingtimes: {
        start: this.start,
        end: this.end,
        user: user,
      },
    };
    const headers = {
      Authorization: `Bearer ${localStorage.token}`,
    };

    await axios
      .post("http://localhost:4000/api/workingtimes", workingtimes, {
        headers,
      })
      .then((response) => {
        console.log(response);

        window.location.reload();
        setTimeout(() => {
          this.sendAlert();
        }, 2500);
      })
      /* eslint-disable */
      .catch((error) => {
        this.errorCredentials = true;
      });
  },
};
</script>

<style>
.v-application .justify-center {
  margin-top: 5%;
}
</style>
