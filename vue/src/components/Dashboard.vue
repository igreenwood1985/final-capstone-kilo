<template>
  <div>
    <h1>hello</h1>
    <dashboard-recipes class="recipes-section"/>
  </div>
</template>

<script>
// import AccountService from "../services/AccountService.js";
import DashboardRecipes from "./DashboardRecipes.vue";

export default {
  components: { DashboardRecipes },
  data() {
    return {
      
    }
  },
  methods: {
    
  }
  
};
</script>

<style>
.recipes-section {
  background-color: yellow;
}
h1 {
  text-align: center;
}
</style>