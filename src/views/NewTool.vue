<template>
  <form class="modal-content" v-on:submit.prevent="createTool()" method="POST">
    <div class="container">
      <h1>Neues Werkzeug</h1>
      <hr />
      <label for="tool_name">
        <b>Werkzeugname</b>
      </label>
      <input
        type="text"
        name="tool_id"
        v-model="tool_name"
        placeholder="Gib dein Werkzeugnamen ein"
        required
      />
      <label for="tool_name">
        <b>Werkzeugtyp</b>
      </label>
      <select v-model="tool_type">
        <option value="0">Tierliste</option>
        <option value="1" disabled>Zeitplan</option>
        <option value="2" disabled>Zeichnung</option>
        <option value="3">Konzeptraum</option>
      </select>
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
      tool_name: "",
      tool_type: "0",
      loading: false
    };
  },
  methods: {
    createTool() {
      this.loading = true;
      var obj = this;

      axios
        .post(
          "/php/createTool.php?tool_type=" +
            obj.tool_type +
            "&tool_name=" +
            obj.tool_name +
            "&party_id=" +
            obj.$route.params.party_id,
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