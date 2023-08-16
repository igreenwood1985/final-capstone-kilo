<template>
  <div>
    <!-- <nav>
          <router-link v-bind:to="{name: 'home'}">Home&nbsp;|&nbsp;</router-link>
          <router-link v-bind:to="{name: 'search'}">Find Recipes&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token != ''" v-bind:to="{name: 'dashboard'}">Dashboard&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token == ''" v-bind:to="{name: 'login'}">Login&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token != ''" v-bind:to="{name: 'logout'}">Logout&nbsp;|&nbsp;</router-link>
          <router-link v-if="$store.state.token == ''" v-bind:to="{name: 'register'}">Register&nbsp;|&nbsp;</router-link>
      </nav> -->

    <b-navbar class="bar">

      <img src="../../header-logo.png" alt="heade logo" class="header-logo" />

      <div class="nav-box">

        <div class="left-nav">
          <b-navbar-brand
            ><router-link v-bind:to="{ name: 'home' }" class="title-text">
              KiloPlanner
            </router-link></b-navbar-brand
          >
          <b-navbar-item
            ><router-link v-bind:to="{ name: 'search' }" class="link-text"
              >Find Recipes Online</router-link
            ></b-navbar-item
          >
          <b-navbar-item><router-link v-if="$store.state.token != ''" v-bind:to="{name: 'dashboard'}" class="link-text">&nbsp;|&nbsp;My Dashboard</router-link></b-navbar-item>
        </div>

        <div class="right-nav">
            <b-navbar-item
            ><router-link v-if="$store.state.token == ''" v-bind:to="{name: 'login'}" class="user-link-text">Login&nbsp;|&nbsp;</router-link></b-navbar-item
          >
          <b-navbar-item
            ><router-link v-if="$store.state.token != ''" v-bind:to="{name: 'logout'}" class="user-link-text">Logout</router-link></b-navbar-item
          >
          <b-navbar-item><router-link v-if="$store.state.token == ''" v-bind:to="{name: 'register'}" class="user-link-text">Register</router-link></b-navbar-item>
        </div>
      </div>
    </b-navbar>
  </div>
</template>

<script>
export default {
  name: "the-header",
};
</script>

<style scoped>
.bar {
  background-color: white;
  border-bottom: 1px solid gray;
}
.nav-header {
  padding-left: 10px;
  font-size: 30px;
}
.nav-box {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
}
.left-nav {
    display: flex;
    align-items: center;
}
.right-nav {
    display: flex;
    align-items: center;
    justify-content: space-around;
    padding-right: 8px;
    margin-right: 3%;
}
.title-text {
  color: black;
  font-size: 20px;
  font-family: saira;
}
.link-text {
  color: black;
  text-decoration: none;
  font-size: 12px;
  font-family: montserrat;
}
.user-link-text {
    color: black;
    text-decoration: none;
    font-size: 14px;
    font-family: montserrat;
}
.header-logo {
  max-width: 3%;
  margin-left: 3%;
}
</style>