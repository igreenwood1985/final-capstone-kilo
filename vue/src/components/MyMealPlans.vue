<template>
  <div>
      <meal-plan-card 
      v-for="mealPlan in this.favoriteMealPlans"
      v-bind:mealPlan="mealPlan"
      v-bind:key="mealPlan.mealPlanId"
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
        favoriteMealPlans: [],
      }
  },
  methods: {
      getAllFavoriteMealPlans() {
          AccountService.getAllMealPlans().then((response)=>{
              this.favoriteMealPlans = response.data;
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