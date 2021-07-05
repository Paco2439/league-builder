<template>
  <form v-on:submit.prevent="$router.push({path: '/login'})">
    <div class="container">
      <h1>Registrierung</h1>
      <hr />
      <p>Ihr Konto wurde erfolgreich erstellt und Sie können sich nach einer Bestätigung der E-Mail anmelden.</p>
      <img src="/images/success.png" alt="confirmed" />
      <button type="submit">Verstanden!</button>
    </div>
  </form>
</template>