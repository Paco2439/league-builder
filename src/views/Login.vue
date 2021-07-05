<template>
  <form v-on:submit.prevent="login()">
    <div class="container">
      <h1>Anmeldung</h1>
      <hr />
      <label for="email">
        <b>E-mail</b>
      </label>
      <input v-model="email" type="email" placeholder="Gib deine E-mail ein" name="email" required />
      <label for="psw">
        <b>Passwort</b>
      </label>
      <input
        v-model="password"
        type="password"
        placeholder="Gib dein Passwort ein"
        name="psw"
        required
      />
      <div class="clearfix">
        <span v-if="info.length > 0" class="info_message">{{info}}</span>
        <button :disabled="loading" type="submit" class="signupbtn">
          <span v-if="!loading">Login</span>
          <div class="loader" v-else></div>
        </button>
        <button
          type="button"
          @click="route()"
          class="signupbtn"
        >Noch keinen Account? Hier registrieren!</button>
      </div>
    </div>
  </form>
</template>

<script>
const axios = require("axios");

export default {
  data() {
    return {
      email: "",
      password: "",
      info: "",
      loading: false
    };
  },
  methods: {
    login() {
      this.info = "";
      this.loading = true;
      var obj = this;

      axios
        .post(
          "/php/login.php?email=" + obj.email + "&password=" + obj.password,
          {}
        )
        .then(function(response) {
          var name = response.data;
          if (name != "none") {
            obj.$router.push({ path: `/user/${name}` });
          } else {
            obj.info = "Dieses Konto ist in unsere Datenbank nicht hinterlegt.";
          }
          obj.loading=false;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    route() {
      this.$router.push({ path: `/register` });
    }
  }
};
</script>

<style>
.info_message {
  color: red;
}
form {
  max-width: 500px;
  margin: auto;
  height: 100%;
}
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }
}
input[type="text"],
input[type="password"],
input[type="email"] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-image: linear-gradient(to right, #be3333, rgb(192, 51, 51));
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}
hr {
  border: 1px solid #be3333;
  margin-bottom: 25px;
}

.container {
  padding: 16px;
  background-color: #2c2f33;
  box-shadow: 0px 0px 15px -4px rgba(0, 0, 0, 0.52);
}

span.psw {
  float: right;
  padding-top: 16px;
}
</style>