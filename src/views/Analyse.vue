<template>
  <div id="match_history">
    <div
      v-for="(match, i) in matches"
      :key="i"
      :class="[{ win: match.win, lose: !match.win}, 'matchbox']"
    >
      <img class="champ_image" :src="match.champion.image" :alt="match.champion.name" />
      <div class="match_info">
        <span>{{match.champion.name}}</span>
        <span>Rolle: {{match.role}}</span>
      </div>
      <div class="match_info">
        <span>Spiellänge: {{Math.round(match.gameLength/60 * 100) / 100}} Min</span>
        <span>Beschwörerlevel: {{match.level}}</span>
      </div>
      <div class="match_info">
        <span>Sichtwertung: {{match.visionScore}}</span>
        <span>Platzierte Kontrollaugen: {{match.controlWards}}</span>
      </div>
      <div class="match_info">
        <span v-if="typeof match.csPerMin['0-10'] != 'undefined'">CS im frühem Spiel: {{Math.round(match.csPerMin['0-10'] * 100) / 100}}/Min</span>
        <span v-if="typeof match.csPerMin['10-20'] != 'undefined'">CS im mittleren Spiel: {{Math.round(match.csPerMin['10-20'] * 100) / 100}}/Min</span>
        <span v-if="typeof match.csPerMin['20-30'] != 'undefined'">CS im spätem Spiel: {{Math.round(match.csPerMin['20-30'] * 100) / 100}}/Min</span>
      </div>
      <div class="match_info">
        <span v-if="typeof match.goldPerMinute['0-10'] != 'undefined'">Gold frühem Spiel: {{Math.round(match.goldPerMinute['0-10'] * 100) / 100}}/Min</span>
        <span v-if="typeof match.goldPerMinute['10-20'] != 'undefined'">Gold im mittleren Spiel:  {{Math.round(match.goldPerMinute['10-20'] * 100) / 100}}/Min</span>
        <span v-if="typeof match.goldPerMinute['20-30'] != 'undefined'">Gold im Späten Spiel:  {{Math.round(match.goldPerMinute['20-30'] * 100) / 100}}/Min</span>
      </div>
      <div class="match_result">
        <h3>{{match.kda.kills}}/{{match.kda.deaths}}/{{match.kda.assists}}</h3>
        <h1 :class="[{ win_text: match.win, lose_text: !match.win}]">
          <span v-if="match.win">GEWONNEN</span>
          <span v-else>VERLOREN</span>
        </h1>
      </div>
    </div>
    <div @click="add()" class="more">
      <h1 v-if="!loading">MEHR LADEN</h1>
      <div class="loader" v-else></div>
    </div>
  </div>
</template>

<script>
const axios = require("axios");

export default {
  data() {
    return {
      matches: [],
      start: 0,
      end: 6,
      loading: false
    };
  },
  beforeMount() {
    this.loading = true;
    var obj = this;
    axios
      .post(
        "/php/analyse.php?start=" +
          obj.start +
          "&end=" +
          obj.end +
          "&name=" +
          obj.$route.params.id,
        {}
      )
      .then(function(response) {
        obj.matches = response.data;
        obj.start += response.data.length;
        obj.end += response.data.length;
        obj.loading = false;
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  methods: {
    add() {
      this.loading = true;
      var obj = this;
      axios
        .post(
          "/php/analyse.php?start=" +
            obj.start +
            "&end=" +
            obj.end +
            "&name=" +
            obj.$route.params.id,
          {}
        )
        .then(function(response) {
          response.data.forEach(match => {
            obj.matches.push(match);
          });
          obj.start += response.data.length;
          obj.end += response.data.length;
          obj.loading = false;
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style scoped>
h1,
h3 {
  margin: 0;
}
#match_history {
  padding: 15px;
}
#match_history {
  overflow: auto;
}
#kda {
  margin-left: 10px;
}
.match_result {
  display: flex;
  flex-direction: column;
  margin-left: auto;
}
.match_info {
  color: lightgray;
  margin-left: 25px;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  flex-direction: column;
}
.more {
  text-align: center;
  background: #be3333;
  border-radius: 10px;
  color: white;
  padding: 10px;
  text-align: center;
  cursor: pointer;
}
.matchbox {
  margin: 20px 0;
  background-color: rgb(29, 29, 29);
  color: white;
  padding: 10px;
  display: flex;
  transition: all 0.15s ease-in-out;
  align-items: center;
  cursor: pointer;
}
.matchbox:hover {
  transform: scale(1.01);
  filter: brightness(115%);
}
.win {
  border-left: 5px solid rgb(42, 177, 22);
}
.lose {
  border-left: 5px solid rgb(190, 51, 51);
}
.win_text {
  color: rgb(42, 177, 22);
}
.lose_text {
  color: #c60000;
}
.champ_image {
  cursor: pointer;
  margin: 5px;
  border: 2px solid #303336;
  height: 70px;
  user-select: none;
  widows: 100px;
  transition: all 0.05s ease-in-out;
}
</style>