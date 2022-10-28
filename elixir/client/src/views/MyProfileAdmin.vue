<template>
  <v-app>
    <v-simple-table dark>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">Name</th>
            <th class="text-left">Calories</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in user.data" v-bind:key="user">
            <td>{{ user["email"] }}</td>
            <td>{{ user["username"] }}</td>
            <v-btn
              :loading="loading"
              class="ma-1"
              color="error"
              plain
              @click="deleteCustomer(user.id)"
            >
              Delete
            </v-btn>
            <v-btn
              :loading="loading"
              class="ma-1"
              color="green"
              plain
              @click="remove"
            >
              Delete
            </v-btn>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
    <div class="my-2">
      <v-btn color="warning" fab dark></v-btn>
    </div>
  </v-app>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      user: [],
    };
  },

  mounted() {
    axios({
      method: "get",

      url: "http://3.86.160.80:8080/",
      format: "json",
    }).then((response) => (this.user = response.data));
  },
  methods: {
    async deleteCustomer(id) {
      axios({
        method: "delete",
        url: `http://3.86.160.80:8080/api/users/${id}`,
        format: "json",
      }).then((data) => {
        console.log(data);
        window.location.reload();
      });
    },
  },
};
</script>

<style></style>
