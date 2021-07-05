<template>
  <div id="app">
    <section id="banner">
      <div id="logo">
        <router-link :to="'/login'" id="site_name">League Builder</router-link>
      </div>
    </section>
    <div v-if="!logged" class="back_image swain"></div>
    <nav>
      <div id="nav_container">
        <router-link
          v-if="logged"
          :to="'/user/'+$route.params.id"
          class="nav_item"
        >Parties</router-link>
        <router-link
          v-if="logged"
          :to="'/user/'+$route.params.id+'/settings'"
          class="nav_item"
        >Profil</router-link>
        <router-link
          v-if="logged"
          :to="'/user/'+$route.params.id+'/analysis'"
          class="nav_item"
        >Spielanalyse</router-link>
        <router-link v-if="logged" id="about_link" :to="'/login'" class="nav_item">Ausloggen</router-link>
      </div>
    </nav>
    <section id="main_content" class="style-3">
      <transition name="fade" mode="out-in">
        <router-view />
      </transition>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      logged: false
    };
  },
  beforeUpdate() {
    if (this.$route.params.id != undefined) {
      this.logged = true;
    } else {
      this.logged = false;
    }
  }
};
</script>

<style>
.style-3::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: rgba(0, 0, 0, 0.75);
}

.style-3::-webkit-scrollbar
{
    width: 10px;
    background-color: #F5F5F5;
}

.style-3::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #be3333;
}
.fade-enter-active,
.fade-leave-active {
  transition: all 0.4s ease;
}

.fade-leave-active {
  transform: translateX(-200px);
  opacity: 0;
}

.fade-enter {
  transform: translateX(200px);
  opacity: 0;
}

.fade2-enter-active,
.fade2-leave-active {
  transition: all 0.4s ease-in-out;
}

.fade2-enter,
.fade2-leave-active {
  opacity: 0;
}

#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: lightgray;
  height: 100%;
}
.back_image {
  z-index: -1;
  height: 100%;
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
}
.swain {
  background-image: url("/images/backgrounds/swain.png");
}
nav {
  background-image: linear-gradient(to right, #be3333, rgb(192, 51, 51));
  height: 50px;
  box-shadow: 0px 0px 11px 0px rgba(0, 0, 0, 0.75);
  color: white;
  position: sticky;
  top: 0;
  height: 5%;
}
#main_content {
  height: 85%;
  overflow-y: auto;
  overflow-x: hidden;
}
#about_link {
  margin-left: auto;
}

#nav_container {
  display: flex;
  height: 100%;
  align-items: center;
}
.tool_item {
  width: 100%;
  display: flex;
  justify-content: center;
  color: lightgray;
  min-width: 150px;
  padding: 5px 0;
  background-color: rgb(41, 41, 41);
  align-items: center;
  margin: 10px 0;
  border-radius: 5px;
  cursor: pointer;
}

#site_name {
  color: white;
  font-size: 7vh;
  font-family: "Lobster", cursive;
  text-shadow: 6px 5px 2px rgb(48, 47, 47);
}

#banner {
  background-color: rgb(41, 41, 41);
  display: flex;
  height: 10%;
  justify-content: center;
}

#tool {
  width: 100%;
  padding: 10px;
}

#login_heading h3 {
  margin: 0;
}

.nav_item {
  padding: 0 10px;
  min-width: 100px;
  height: 100%;
  color: white;
  text-decoration: none;
  transition: all 0.1s ease-in-out;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}

.nav_item i {
  color: white;
  margin-right: 5px;
}

.nav_item:hover i {
  color: black;
}

.nav_item:hover {
  color: black;
  background: white;
}
.loader {
  border: 2px solid #f3f3f3; /* Light grey */
  border-top: 2px solid #be3333; /* Blue */
  border-radius: 50%;
  width: 18px;
  height: 18px;
  animation: spin 2s linear infinite;
  margin: auto;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
html,
body,
* {
  box-sizing: border-box;
  font-family: "Roboto", Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  margin: 0;
  height: 100vh;
  background-color: rgb(41, 41, 41);
  overflow: hidden;
}
</style>