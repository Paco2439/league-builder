<template>
  <form v-on:submit.prevent="$router.go(-1)">
    <div class="container">
      <h1>Hilfe zu deiner Verifizierung</h1>
      <hr />
      <p>Damit Sie ihr Konto mit dem Riot Konto verknüpfen können, müssen Sie zuerst bestätigen das Sie der rechtmäßige Besitzer dieses Konto sind. Damit dies funktioniert müssen Sie für den Lauf der Registrierung ein bestimmtes Summoner Icon auswählen. Wählen Sie also nun folgendes Icon aus und setzen Sie ihre registrierung fort.</p>
      <img src="/images/baum.png" alt="iconid->21" />
      <button type="submit">Verstanden!</button>
    </div>
  </form>
</template>