<template>
  <div>
    <h1>{{mealPlan.name}}
                <b-button variant="danger" v-on:click="deleteMealPlan()">Delete</b-button>

    </h1>
 <meal-card
      v-for="meal in mealPlan.meals"
      v-bind:meal="meal"
      v-bind:key="meal.id"
      v-bind:enable-add="true"
    />
  </div>
</template>

<script>
import AccountService from '../services/AccountService';

import MealCard from './MealCard.vue';


export default {
  name: "meal-plan-details-component",
  data() {
    return {
      mealPlan:{}
    }
  },
  components:{
  
    MealCard
  },
 methods: {
        retrieveMealPlanByID() {
            AccountService.getMealPlanByID(this.$route.params.id).then(response => {
                this.mealPlan = response.data;
            });
        },
         deleteMealPlan() {
            AccountService.deleteMealPlan(this.$route.params.id).then(response => {
                if (response.status !== 200) {
                    this.$router.push("/dashboard");
                    this.$store.commit('REMOVE_MEAL_PLAN', this.mealPlan);
                }
            })
        }
        
    },
     created() {
        this.retrieveMealPlanByID();
    }


}
</script>

<style>

</style>