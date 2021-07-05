<template>
  <div id="user_view">
    <div id="rooms">
      <h3>Partys</h3>
      <div :key="room + i" v-for="(room, i) in rooms">
        <button @click="switchMenu(i)" class="signupbtn">{{ room.name }}</button>
        <div class="tool_menu" v-if="room.show">
          <h4 v-if="room.tools.length!=0">--- Werkzeuge ---</h4>
          <div :key="tool + o" v-for="(tool, o) in room.tools" class="tool_container">
            <button
              @click="changeTool($route.params.id,tool.type, tool.id)"
              :class="['tool_item', tool.type,'signupbtn']"
            >{{ tool.name }}</button>
            <i
              v-if="room.owner == $route.params.id"
              class="material-icons"
              @click="deleteTool(tool.id, tool.type, tool.name, i , o)"
            >clear</i>
          </div>
          <h4>--- Mehr ---</h4>
          <button
            v-if="room.owner == $route.params.id"
            @click="newTool(room.id)"
            class="tool_item signupbtn"
          >Neues Werkzeug</button>
          <button
            @click="deleteParty(i, room.name, room.id)"
            v-if="room.owner == $route.params.id"
            class="tool_item signupbtn"
          >Party löschen</button>
          <button
            v-if="$route.params.id !== room.owner"
            @click="deleteUser(i, room.name, room.id)"
            class="tool_item signupbtn"
          >Party verlassen</button>
          <h4>Schlüssel: {{room.invite}}</h4>
        </div>
      </div>
      <button
        @click="$router.push({path:'/user/'+$route.params.id+'/join'})"
        class="signupbtn"
        style="margin-top: auto;"
      >Party beitreten</button>
      <button
        @click="$router.push({path:'/user/'+$route.params.id+'/create'})"
        class="signupbtn"
      >Party erstellen</button>
    </div>
    <div id="tool">
      <transition name="fade2" mode="out-in">
        <router-view :key="$route.params.tool_id" />
      </transition>
    </div>
  </div>
</template>

<script>
const axios = require("axios");

export default {
  name: "SelectView",
  data() {
    return {
      rooms: [],
    };
  },
  methods: {
    isOwner(name){
      return name == this.$route.params.id;
    },
    switchMenu(index) {
      this.rooms.forEach(room => {
        room.show = false;
      });
      this.rooms[index].show = true;
    },
    changeTool(user, toolType, toolId) {
      this.$router.push({ path: `/user/${user}/${toolType}/${toolId}` });
    },
    newTool(party_id) {
      this.$router.push({
        path: "/user/" + this.$route.params.id + "/" + party_id + "/new"
      });
    },
    deleteTool(id, type, name, i, o) {
      if (
        confirm("Wirklich das Werkzeug " + name + " aus deiner Party löschen?")
      ) {
        var obj = this;
        axios
          .post("/php/deleteTool.php?tool_type=" + type + "&tool_id=" + id, {})
          .then(function() {
            obj.rooms[i].tools.splice(o, 1);
            obj.$router.push({ path: "/user/" + obj.$route.params.id });
          })
          .catch(function(error) {
            console.log(error);
          });
      }
    },
    deleteParty(index, name, party_id) {
      if (
        confirm(
          "Möchtest du wirklich deine Party '" +
            name +
            "' mit samt Werkzeugen löschen?"
        )
      ) {
        var obj = this;
        this.rooms[index].tools.forEach(tool => {
          axios
            .post(
              "/php/deleteTool.php?tool_type=" +
                tool.type +
                "&tool_id=" +
                tool.id,
              {}
            )
            .catch(function(error) {
              console.log(error);
            });
        });
        axios
          .post("/php/deleteParty.php?party_id=" + party_id, {})
          .then(function() {
            obj.rooms.splice(index, 1);
            obj.$router.push({ path: "/user/" + obj.$route.params.id });
          })
          .catch(function(error) {
            console.log(error);
          });
      }
    },
    deleteUser(i, name, party_id){
      if(confirm("Wirklich die Party '"+name+"' verlassen?")){
        var obj = this;
        axios
          .post("/php/deleteUser.php?party_id=" + party_id+ "&user_email="+obj.$route.params.id, {})
          .then(function() {
            obj.rooms.splice(i, 1);

          })
          .catch(function(error) {
            console.log(error);
          });
      }
    }
  },
  beforeMount() {
    var obj = this;

    axios
      .post("/php/getUserInfo.php?email=" + obj.$route.params.id, {})
      .then(function(response) {
        obj.rooms = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
  }
};
</script>

<style scoped>
i {
  cursor: pointer;
}
.tool_container {
  display: flex;
  align-items: center;
}
h4 {
  margin: 0;
  text-align: center;
}
.tool_menu {
  padding: 10px;
  border-top: 1px solid;
  border-bottom: 1px solid;
}
.room_item:hover {
  text-decoration: underline;
}
#rooms {
  overflow: auto;
  width: 250px;
  background-color: #303336;
  display: inline-flex;
  flex-direction: column;
  padding: 5px;
}
.room_item {
  width: 100%;
  display: flex;
  justify-content: center;
  color: lightgray;
  padding: 5px 0;
  background-color: rgb(41, 41, 41);
  align-items: center;
  margin: 5px 0;
  min-width: 150px;
  border-radius: 5px;
  cursor: pointer;
}
h3 {
  margin: 0;
  text-align: center;
  font-size: 1.5rem;
  padding: 5px;
  color: lightgray;
}
#user_view {
  height: 100%;
  display: flex;
}
</style>