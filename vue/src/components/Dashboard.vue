<template>
  <div>
    <div class="grid-container">
      <h1>hello</h1>
      <dashboard-recipes class="recipes-section" />
      <dashboard-meal-plans class="meal-plans-section" />
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
    "recipes mealPlan"
    "meals mealPlan";
}

h1 {
  text-align: center;
  grid-area: header;
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