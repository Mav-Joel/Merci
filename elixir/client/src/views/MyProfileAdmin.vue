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
          <tr v-for="user in user.data" v-bind:key="user.username">
            <td>{{ user["email"] }}</td>
            <td>{{ user["username"] }}</td>
            <v-btn
              class="ma-1"
              color="error"
              plain
              @click="deleteCustomer(user.id)"
            >
              Delete
            </v-btn>
            <UpdateModal />
          </tr>
        </tbody>
      </template>
    </v-simple-table>
    <CreationModal />
  </v-app>
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
    deleteCustomer(id) {
      
      axios({
        method: "delete",
        url: `http://localhost:4000/api/users/${id}`,
        format: "json",
      }).then((data) => {
        console.log(data);
      });
    },
  },
};
</script>

<style></style>
