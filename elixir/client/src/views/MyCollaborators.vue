<template>
  <ul id="example-1">
    <li v-for="user in user.data" v-bind:key="user">
      <div class="card-user">
        <v-card class="mx-auto" max-width="344" outlined>
          <v-list-item three-line>
            <v-list-item-content>
              <v-list-item-title class="text-h5 mb-1">
                {{ user["email"] }}
                <br />
                {{ user["username"] }}
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
    </li>
  </ul>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      user: null,
    };
  },

  mounted() {
    axios({
      method: "get",
      url: "http://localhost:4000/api/users/",
      format: "json",
    }).then((response) => (this.user = response.data));
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
