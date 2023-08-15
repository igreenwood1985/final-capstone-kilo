<template>
  <div>
      <meal-plan-card 
      v-for="mealPlan in this.favoriteMealPlans"
      v-bind:mealPlan="mealPlan"
      v-bind:key="mealPlan.meal_plan_id"
      v-bind:enable-add="true"
      
      />

  </div>
</template>

<script>
import AccountService from '../services/AccountService'
import MealPlanCard from './MealPlanCard.vue'


export default {
    name: "my-meal-plans-component",
  components: { MealPlanCard },
  data() {
      return { 
        favortieMealPlans: [],
      }
  },
  methods: {
      getAllFavoriteMealPlans() {
          AccountService.getAllMealPlans().then((response)=>{
              this.favortieMealPlans = response.data;
          });
      }
  },
  created(){
      this.getAllFavoriteMealPlans();
  }

}
</script>

<style>
.heading {
  display: block;
}

</style>