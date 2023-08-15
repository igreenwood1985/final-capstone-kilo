<template>
  
  <div>
      <overview-dashboard v-show="showOverview" />
      <recipes-dashboard v-show="showRecipes" />
      <meals-dashboard v-show="showMeals"/>
      <meal-plans-dashboard v-show="showMealPlans" />
  </div>

</template>

<script>
import OverviewDashboard from './OverviewDashboard.vue';
import RecipesDashboard from './RecipesDashboard.vue';
import MealsDashboard from './MealsDashboard.vue';
import MealPlansDashboard from './MealPlansDashboard.vue';

export default {
    name: 'Dashboard',
    components: {
        OverviewDashboard,
        RecipesDashboard,
        MealsDashboard,
        MealPlansDashboard
    },
    data() {
        return {
            showOverview: false,
            showRecipes: false,
            showMeals: false,
            showMealPlans: true
        }
    }
};
</script>

<style>

</style>