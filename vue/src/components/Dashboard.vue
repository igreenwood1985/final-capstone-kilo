<template>
  <div>
    <div class="grid-container">
      <h1>heading</h1>
      <h2 class="recipes-title">My Favorite Recipes</h2>
      <dashboard-recipes class="recipes-section" />
      <h2 class="mealplans-title">My Meal Plans</h2>
      <dashboard-meal-plans class="meal-plans-section" />
      <h2 class="meals-title">My Meals</h2>
      <dashboard-meals class="meals-section" />
    </div>
  </div>
</template>

<script>
import DashboardMealPlans from "./DashboardMealPlans.vue";
import DashboardMeals from "./DashboardMeals.vue";
// import AccountService from "../services/AccountService.js";
import DashboardRecipes from "./DashboardRecipes.vue";

export default {
  components: { DashboardRecipes, DashboardMealPlans, DashboardMeals },
  data() {
    return {};
  },
  methods: {},
};
</script>

<style>
.grid-container {
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-template-areas:
    "header header"
    "recipes-title mealPlan-title"
    "recipes mealPlan"
    "meals-title mealPlan"
    "meals mealPlan";
}

h1 {
  text-align: center;
  grid-area: header;
}

.recipes-title {
  grid-area: recipes-title;
  border: 2px solid black;
  text-align: center;
}

.meals-title {
  grid-area: meals-title;
  text-align: center; 
}

.mealplans-title {
  grid-area: mealPlan-title;
  text-align: center;
}

.recipes-section {
  grid-area: recipes;
  display: flex;
  align-items: center;
  justify-content: space-around;
  background-color: yellow;
}

.meal-plans-section {
  grid-area: mealPlan;
  background-color: red;
}
.meals-section {
  grid-area: meals;
  background-color: blue;
}
</style>