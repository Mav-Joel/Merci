<template>
  <div id="app">
    <v-app id="inspire">
      <v-content>
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
                    <v-btn outlined rounded text> Update </v-btn>
                  </v-card-actions>
                  <v-card-actions>
                    <v-btn outlined rounded text> Delete </v-btn>
                  </v-card-actions>
                </v-card>
              </div>
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
      user: {
        username: "username",
        email: "email",
      },
    };
  },

  mounted(id) {
    id = this.$route.params.id;
    console.log("1", id);
    axios({
      method: "get",
      url: `http://localhost:4000/api/users/${id}`,
      format: "json",
    }).then(({ data }) => {
      this.user.email = data.data.email;
      this.user.username = data.data.username;

      console.log(this.user);
    });
  },
};
</script>
