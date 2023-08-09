<template>
  <div>
    <div class="grid-container">
      <h1>hello</h1>
      <dashboard-recipes class="recipes-section"/>
      <dashboard-meal-plans class="meal-plans-section"/>
      <dashboard-meals class="meals-sections"/>
      

    </div>
    
    
  </div>
</template>

<script>
import DashboardMealPlans from './DashboardMealPlans.vue';
import DashboardMeals from './DashboardMeals.vue';
// import AccountService from "../services/AccountService.js";
import DashboardRecipes from "./DashboardRecipes.vue";


export default {
  components: { DashboardRecipes, DashboardMealPlans, DashboardMeals },
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
grid-template-columns: 2fr 1fr ;
grid-template-areas: 
"header header"
"recipes mealPlan"
"meals mealPlan"

;
}
.recipes-section {
  grid-area: recipes;
}
h1 {
  grid-area: header;
}
.meal-plans-section {
  grid-area: mealPlan;
}
.meals-section {
  grid-area: meals;
}
</style>