<template>
  <div id="app">
    <v-app>
      <v-simple-table dark>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left">Mail</th>
              <th class="text-left">UserNames</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in user.data" v-bind:key="user.username">
              <td>{{ user["email"] }}</td>
              <td>{{ user["username"] }}</td>
              <v-btn
                class="ma-1"
                color="error"
                plain
                @click="deleteCustomer(user)"
              >
                Delete
              </v-btn>
              <UpdateModal :identifier="user['id']" />
            </tr>
          </tbody>
        </template>
      </v-simple-table>
      <CreationModal />
    </v-app>
  </div>
</template>

<script>
import axios from "axios";
import CreationModal from "@/components/CreationModal.vue";
import UpdateModal from "@/components/UpdateModal.vue";

export default {
  data() {
    return {
      user: [],
    };
  },
  components: {
    CreationModal,
    UpdateModal,
  },

  mounted() {
    axios({
      method: "get",
      url: "http://localhost:4000/api/users/",
      format: "json",
    }).then((response) =>
      response ? (this.user = response.data) : console.log("yikers")
    );
  },
  methods: {
    deleteCustomer(user) {
      axios({
        method: "delete",
        url: `http://localhost:4000/api/users/`,
        format: "json",
        headers: {
          Authorization: `Bearer ${localStorage.token}`,
        },
        data: {
          id: user.id,
        },
      }).then((data) => {
        window.location.reload();
        console.log(data);
      });
    },
  },
};
</script>

<style></style>
