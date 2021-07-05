<template>
  <form class="modal-content" v-on:submit.prevent="register()" method="POST">
    <div class="container">
      <h1>Registrierung</h1>
      <hr />
      <label for="email">
        <b>E-mail</b>
      </label>
      <input v-model="email" type="email" placeholder="Gib deine E-mail an" name="email" required/>
      <label for="luname">
        <b>Beschwörername</b>
        (<router-link :to="'/register/help'">?</router-link>)
      </label>
      <input
        type="text"
        v-model="lname"
        placeholder="Gib dein Beschwörernamen ein"
        name="LeagueUsername"
        required
      />
      <select v-model="region">
        <option value="euw1">EUW</option>
        <option value="eun1">EUN</option>
        <option value="br1">BR</option>
        <option value="jp1">JP</option>
        <option value="kr">KR</option>
        <option value="la1">LA1</option>
        <option value="la2">LA2</option>
        <option value="na1">NA</option>
        <option value="oc1">OC</option>
        <option value="tr1">TR</option>
        <option value="ru">RU</option>
      </select>
      <label for="psw">
        <b>Passwort</b>
      </label>
      <input type="password" v-model="pw1" placeholder="Gib ein Passwort ein" name="psw" required />

      <label for="psw-repeat">
        <b>Passwort wiederholen</b>
      </label>
      <input
        type="password"
        v-model="pw2"
        placeholder="Passwort wiederholen"
        name="psw-repeat"
        required
      />
      <div class="clearfix">
        <span v-if="info.length > 0" class="info_message">{{info}}</span>
        <button :disabled="loading" type="submit" class="signupbtn">
          <span v-if="!loading">Registrieren</span>
          <div class="loader" v-else> </div>
        </button>
        <button type="button" @click="route()" class="signupbtn">Bereits ein Account? Auf zum Login!</button>
      </div>
    </div>
    <router-view/>
  </form>
</template>

<script>
const axios = require("axios");

export default {
  data() {
    return {
      email: "",
      pw1: "",
      pw2: "",
      lname: "",
      info: "",
      loading: false,
      region: "euw1"
    };
  },
  methods: {
    route() {
      this.$router.push({ path: `/login` });
    },
    register() {
      this.info = "";
      this.loading=true;
      if (this.pw1 == this.pw2) {
        var obj = this;
        axios
          .post(
            "/php/register.php?email=" +
              obj.email +
              "&password=" +
              obj.pw1 +
              "&lname=" +
              obj.lname +
              "&region=" +
              obj.region,
              {}
          )
          .then(function(response) {
            if(response.data == 200){
              obj.$router.push({ path: `/register/success` });
            } else if(response.data == 201){
              obj.info="Diese Email wird bereits von einem Account in Anspruch genommen.";
            } else if(response.data == 202){
              obj.info="Bei dem Verifizieren ist ein Fehler aufgetreten. Klicke auf das Fragezeichen neben dem Beschwörernamen für mehr Hilfe.";
            } else  if(response.data == 205){
              obj.info="Leider konnten wir den Riot Account nicht finden. Bitte stelle sicher das du die richtige Region ausgewählt hast.";
            }
           obj.loading=false;
          })
          .catch(function(error) {
            console.log(error);
          });
      } else {
        this.loading=false;
        this.info = "Die Passwörter stimmen nicht überein.";
      }
    }
  }
};
</script>

<style scoped>
select {
  width:20%;
  display: inline-block;
  padding: 12px 20px;
  margin: 8px 0;
  border: none;
  color: white;
  background-image: linear-gradient(to right,#be3333, rgb(192, 51, 51));
  outline: none;
}
input[name="LeagueUsername"]{
  width: 80%;
}
option {
  background-color: #be3333;
  color: white;
}
</style>