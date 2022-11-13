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
                        <p>{{ out }} hours</p>
                        <p>{{ clocked }}</p>
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
                    <v-btn outlined rounded text v-on:click="postClocks()" >
                      Start
                    </v-btn>
                  </v-card-actions>
                  <v-card-actions>
                    <v-btn outlined rounded text v-on:click="stopClocks()" > Stop </v-btn>
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
      out: 0,
      clocked: "Not clocked in",

      time: "",
      status: "",
    };
  },

  mounted() {
    
    localStorage.present = false
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
    postClocks() {
      const headers = {
        Authorization: `Bearer ${localStorage.token}`,
      };

      const milliSecDate = new Date().getTime();
      const currentTime = new Date(milliSecDate)
      console.log(currentTime)
      localStorage.start = currentTime.getHours()

      axios.post('http://localhost:4000/api/clocks/',{
        clock: {
            time: currentTime,
            status: true,
            user: localStorage.id
          }
      },{headers}).then(({ data }) => {
        console.log(data)
        this.clocked = "Clocked in"

      })
    },

    stopClocks() {
      const headers = {
        Authorization: `Bearer ${localStorage.token}`,
      };

      const milliSecDate = new Date().getTime();
      const currentTime = new Date(milliSecDate)
      this.out = currentTime.getHours() - localStorage.start
      
      axios.post('http://localhost:4000/api/clocks/',{
        clock: {
            time: currentTime,
            status: false,
            user: localStorage.id
          }
      },{headers}).then(({ data }) => {
        console.log(data)
        this.clocked = "Clocked out"
      })
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
