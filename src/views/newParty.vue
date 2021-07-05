<template>
  <form class="modal-content" v-on:submit.prevent="createTool()" method="POST">
    <div class="container">
      <h1>Neue Party</h1>
      <hr />
      <label for="party_name">
        <b>Partyname</b>
      </label>
      <input
        type="text"
        name="party_name"
        v-model="party_name"
        placeholder="Gib dein Partynamen ein"
        required
      />
      <div class="clearfix">
        <button :disabled="loading" type="submit" class="signupbtn">
          <span v-if="!loading">Erstellen</span>
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
      party_name: "",
      loading:false
    };
  },
  methods: {
    createTool() {
      this.loading = true;
      var obj = this;

      axios
        .post(
          "/php/createParty.php?party_name=" +
            obj.party_name +
            "&owner=" +
            obj.$route.params.id,
          {}
        )
        .then(function() {
          obj.loading = false;
          obj.$router.push({path: '/user/'+obj.$route.params.id});
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