<template>
  <div id="app">
    <v-app>
      <v-main>
        <v-container fluid fill-height>
          <v-layout align-center justify-center>
            <v-flex xs12 sm8 md4>
              <div class="card-user">
                <v-card class="mx-auto" max-width="344" outlined>
                  <v-list-item three-line>
                    <v-list-item-content>
                      <v-list-item-title class="text-h5 mb-1">
                        <p>{{ user.username }}</p>
                        <p>{{ user.email }}</p>
                        <br />
                      </v-list-item-title>
                      <v-list-item-subtitle
                        >Greyhound divisely hello coldly
                        fonwderfully</v-list-item-subtitle
                      >
                    </v-list-item-content>
                    <v-list-item-avatar
                      tile
                      size="80"
                      color="grey"
                    ></v-list-item-avatar>
                  </v-list-item>
                  <v-card-actions>
                    <v-btn outlined rounded text @click="postClocks()">
                      Start
                    </v-btn>
                  </v-card-actions>
                  <v-card-actions>
                    <v-btn outlined rounded text> Stop </v-btn>
                  </v-card-actions>
                </v-card>
              </div>
            </v-flex>
          </v-layout>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      user: {
        username: "username",
        email: "email",
      },
    };
  },

  mounted(id) {
    this.getClocks();
    id = localStorage.id;
    console.log("1", id);
    axios({
      method: "get",
      url: `http://localhost:4000/api/users/${localStorage.id}`,
      format: "json",
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    }).then(({ data }) => {
      this.user.email = data.data.email;
      this.user.username = data.data.username;

      console.log(this.user);
    });
  },

  methods: {
    getClocks() {
      axios({
        method: "get",
        url: `http://localhost:4000/api/clocks`,
        format: "json",
        headers: {
          Authorization: `Bearer ${localStorage.token}`,
        },
      }).then(({ response }) => {
        console.log(response);
      });
    },

    postClocks() {
      const clockIn = {
        clock: {
          time: this.time,
          status: this.status,
          user: this.user,
        },
      };
      axios({
        method: "post",
        url: `http://localhost:4000/api/clocks`,
        clockIn,
        format: "json",
        headers: {
          Authorization: `Bearer ${localStorage.token}`,
        },
      }).then(({ response }) => {
        console.log(response);
      });
    },
  },
};
</script>
<style>
.v-main {
  max-width: 50%;
  max-height: 50%;
}
</style>
