<template>
  
  <div>
      <nav>
          <router-link v-bind:to="{name: 'home'}">Home&nbsp;|&nbsp;</router-link>
          <router-link v-bind:to="{name: 'search'}">Find Recipes&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token != ''" v-bind:to="{name: 'dashboard'}">Dashboard&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token == ''" v-bind:to="{name: 'login'}">Login&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token != ''" v-bind:to="{name: 'logout'}">Logout&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token == ''" v-bind:to="{name: 'register'}">Register&nbsp;|&nbsp;</router-link>
      </nav>
  </div>

</template>

<script>
export default {
    name: 'the-header'
}
</script>

<style>

</style>