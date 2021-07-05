<template>
  <div id="tierlist">
    <div style="position: relative; display: block;" id="tablewrap" class="create">
      <table>
        <tbody>
          <tr v-for="(listItem,i) in tierlist" :key="i">
            <td style="width: 7% !important">
              <span class="label">{{listItem.name}}</span>
            </td>
            <td class="champs" @dragover.prevent @drop.prevent="addChampion(i)">
              <img
                @dblclick="removeChampion(i,o)"
                class="champ_image"
                style="border-radius: 0; user-drag:none;"
                :key="champ+o"
                v-for="(champ,o) in listItem.champions"
                :src="champ.src"
                :alt="champ.name"
              />
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="champ_view">
      <div id="box_heading">
        <h1>Champions</h1>
        <div id="champ_search_container">
          <input placeholder="Suchen" v-model="search" id="champ_search" type="text" />
        </div>
      </div>
      <transition-group name="fade" tag="div" id="champ_container" class="style-3">
        <div
          style="position: relative;"
          v-bind:key="champ.name+i+'0'"
          v-for="(champ,i) in champions"
        >
          <img
            v-if="champ.name.includes(search)"
            @dragstart="selectChampion(i)"
            :class="['champ_image', {champ_active:champ.show}]"
            :src="champ.src"
            :alt="champ.name"
          />
          <h4 v-if="champ.show" class="champ_heading">{{champ.name}}</h4>
        </div>
      </transition-group>
    </div>
    <div>
      <div class="clearfix"></div>
    </div>
  </div>
</template>

<script>
const axios = require("axios");

export default {
  data() {
    return {
      tierlist: [],
      selected: {},
      search: "",
      champions: []
    };
  },
  beforeMount() {
    this.updateView();
  },
  methods: {
    updateView() {
      var obj = this;
      var r_champions = [];

      axios
        .get(
          "/php/getTierlistInfo.php?tool_id=" + obj.$route.params.tool_id,
          {}
        )
        .then(function(response) {
          obj.tierlist = response.data;
          obj.tierlist.forEach(tier => {
            tier.champions.forEach(champ => {
              r_champions.push(champ.name);
            });
          });
          var obj2 = obj;
          axios
            .get(
              "/php/getChampions.php?new_list=" + JSON.stringify(r_champions),
              {}
            )
            .then(function(response) {
              obj2.champions = response.data;
            })
            .catch(function(error) {
              console.log(error);
            });
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    selectChampion(index) {
      this.selected = this.champions[index];
    },
    removeChampion(i, o) {
      this.champions.push(this.tierlist[i].champions[o]);
      this.tierlist[i].champions.splice(o, 1);
      this.saveState();
    },
    addChampion(index) {
      this.tierlist[index].champions.push(this.selected);
      for (let index = 0; index < this.champions.length; index++) {
        const champ = this.champions[index];
        if (champ.id == this.selected.id) {
          this.champions.splice(index, 1);
        }
      }
      this.saveState();
    },
    saveState() {
      var obj = this;
      axios
        .get(
          "/php/updateTierlist.php?tool_id=" +
            obj.$route.params.tool_id +
            "&new_list=" +
            JSON.stringify(obj.tierlist),
          {}
        )
        .then(function() {})
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style scoped>
#tablewrap {
  width: 100%;
  padding-right: 10px;
}

table {
  width: 100%;
  margin-left: auto;
  margin-right: auto;
  border-spacing: 0;
  height: 100%;
  border: solid 1px black;
  background: #1a1a1a;
}
tr {
  line-height: 0px;
}
td {
  border: solid 1px black;
  margin: 0;
  padding: 0;
  height: 80px;
}

.label {
  text-align: center;
  border: none;
  margin: 0;
  display: inline-block;
  color: #333;
  font-weight: bold;
  font-size: 20px;
  width: 100%;
  text-shadow: -1px 0 rgb(177, 177, 177), 0 1px rgb(177, 177, 177),
    1px 0 rgb(177, 177, 177), 0 -1px rgb(177, 177, 177);
}

#tierlist {
  height: 100%;
  display: flex;
}
.champ_view {
  width: 100%;
  max-width: 300px;
  margin-left: auto;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  background-color: #303336;
}
.champ_image {
  border-radius: 50%;
  cursor: pointer;
  margin: 5px;
  border: 2px solid #303336;
  height: 70px;
  user-select: none;
  widows: 100px;
  transition: all 0.05s ease-in-out;
}
.champ_heading {
  color: white;
  user-select: none;
  margin: 0;
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}
#champ_search_container {
  margin-top: 5px;
}
#box_heading {
  background: #be3333;
  color: white;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  padding: 5px 10px;
  display: flex;
  height: 12%;
  flex-direction: column;
  justify-content: left;
}
h1 {
  margin: 0;
}
#champ_search {
  background: transparent;
  color: white;
  border: none;
  width: 100%;
  border-bottom: 1px solid white;
  transition: all 0.1s ease-in-out;
}
#champ_container {
  overflow: auto;
  padding: 5px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  max-height: 88%;
}
.champ_image:hover {
  filter: brightness(55%);
}

.champ_active {
  transform: scale(1.05);
  filter: brightness(55%);
}
</style>
