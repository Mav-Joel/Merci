<template>
  <div id="app">
    <v-app id="inspire">
      <v-main>
        <v-container fluid fill-height>
          <v-layout align-center justify-center>
            <v-flex xs12 sm8 md4>
              <div id="example-1">
                <!-- <p>{{ user }}</p>
                <p>{{ team }}</p> -->
                <div v-for="team in team.data" v-bind:key="team.id">
                  <p>TEAM : {{ team["name"] }}</p>
                  <div v-for="user in user.data" v-bind:key="user.id">
                    <div v-if="team.id === user.team && user.role === user"></div>
                    <div v-if="team.id === user.team">
                      <div class="card-user">
                        <v-card class="mx-auto" max-width="344" outlined>
                          <v-list-item three-line>
                            <v-list-item-content>
                              <v-list-item-title class="text-h5 mb-1">
                                {{ user["email"] }}
                                <br />
                                {{ user["username"] }}
                              </v-list-item-title>
                              <v-list-item-subtitle>Greyhound divisely hello coldly
                                fonwderfully</v-list-item-subtitle>
                            </v-list-item-content>
                            <v-list-item-avatar tile size="80" color="grey"></v-list-item-avatar>
                          </v-list-item>
                        </v-card>
                      </div>
                    </div>
                  </div>
                </div>
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
      user: [],
      team: [],
    };
  },

  mounted() {
    axios({
      method: "get",
      url: "http:/18.233.170.155:4000/api/users/",
      format: "json",
    }).then((response) => (this.user = response.data)),
      axios({
        method: "get",
        url: "http://18.233.170.155:4000/api/team",
        format: "json",
      }).then((response) => (this.team = response.data));
  },
};
</script>

<style>
.card-user {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  flex-wrap: nowrap;
}
</style>
