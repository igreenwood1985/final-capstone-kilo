<template>
  <div>
    <div class="grid-container">
      <h1>hello</h1>
      <dashboard-recipes class="recipes-section"/>

    </div>
    
    
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
.grid-container {
  display: grid;
grid-template-columns: 1fr 1fr ;
grid-template-areas: 
"header header"
"recipes mealPlan"
"meals mealPlan"



;
}
</style>