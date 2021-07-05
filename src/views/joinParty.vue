<template>
  <form class="modal-content" v-on:submit.prevent="createTool()" method="POST">
    <div class="container">
      <h1>Party beitreten</h1>
      <hr />
      <label for="party_invite_key">
        <b>Partyschlüssel</b>
      </label>
      <input
        type="text"
        name="party_invite_key"
        v-model="party_invite_key"
        placeholder="Gib den Partyschlüssel ein"
        required
      />
      <div class="clearfix">
        <span v-if="info.length > 0" class="info_message">{{info}}</span>
        <button :disabled="loading" type="submit" class="signupbtn">
          <span v-if="!loading">Beitreten</span>
          <div class="loader" v-else></div>
        </button>
        <button type="button" @click="$router.go(-1)" class="signupbtn">Zurück</button>
      </div>
    </div>
    <router-view />
  </form>
</template>

<script>
const axios = require("axios");

export default {
  data() {
    return {
      party_invite_key: "",
      info: "",
      loading: false
    };
  },
  methods: {
    createTool() {
      this.loading = true;
      this.info = "";
      var obj = this;

      axios
        .post(
          "/php/joinParty.php?key=" +
            obj.party_invite_key +
            "&email=" +
            obj.$route.params.id,
          {}
        )
        .then(function(response) {
          obj.loading = false;
          if (response.data == "404") {
            obj.info = "Es wurde keine Party mit diesem Schlüssel gefunden.";
          } else if (response.data == "201") {
            obj.info = "Du bist bereits ein Teil dieser Party.";
          } else if (response.data == "200") {
            obj.$router.push({ path: "/user/" + obj.$route.params.id });
          }
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style scoped>
select {
  width: 100%;
  display: block;
  padding: 12px 20px;
  margin: 8px 0;
  border: none;
  color: white;
  background-image: linear-gradient(to right, #be3333, rgb(192, 51, 51));
  outline: none;
}
option {
  background-color: #be3333;
  color: white;
}
</style>