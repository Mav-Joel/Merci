<template>
  <div id="app">
    <v-card-text class="text-center">
      <router-link to="/MyWorkingTimes">
        <v-divider class="mx-4" vertical></v-divider>
        <v-btn text> My WorkingTimes </v-btn>
      </router-link>
      <router-link to="/">
        <v-btn text> My TimeManager </v-btn>
      </router-link>
    </v-card-text>
    <div>
      <v-simple-table dense>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left">ID</th>
              <th class="text-left">Start</th>
              <th class="text-left">End</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="workingtime in workingtime.data"
              v-bind:key="workingtime.id"
            >
              <td>{{ workingtime["id"] }}</td>
              <td>{{ workingtime["start"] }}</td>
              <td>{{ workingtime["end"] }}</td>
              <v-btn class="mx-2" fab dark small color="cyan">
                <v-icon dark> mdi-pencil </v-icon>
              </v-btn>
              <v-btn
                @click="deleteWorkingTime(workingtime.id)"
                class="mx-2"
                fab
                dark
                small
                color="primary"
              >
                <v-icon dark> mdi-minus </v-icon>
              </v-btn>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </div>
    <MyCards />
  </div>
</template>

<script>
import axios from "axios";
import MyCards from "./MyCards.vue";
export default {
  name: "HomeView",
  components: {
    MyCards,
  },
  data() {
    return {
      workingtime: [],
    };
  },
  mounted() {
    axios({
      method: "get",
      url: `http://localhost:4000/api/workingtimes`,
      format: "json",
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    }).then((response) => (this.workingtime = response.data)),
      console.log(this.workingtime);
  },

  methods: {
    deleteWorkingTime(id) {
      axios({
        method: "delete",
        url: `http://localhost:4000/api/workingtimes/${id}`,
        format: "json",
        headers: {
          Authorization: `Bearer ${localStorage.token}`,
        },
      }).then(() => window.location.reload());
    },

    postWorkingTime() {

        
    }
  },
};
</script>

<style></style>
