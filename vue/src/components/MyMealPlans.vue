<template>
  <div>
    <meal-plan-card 
    v-for="mealPlan in updateMealPlans"
    v-bind:mealPlan="mealPlan"
    v-bind:key="mealPlan.mealPlanId"
    v-bind:enable-add="true"
    v-show="updateMealPlans.length !== 0"
    />
    <h1 class="empty-meal-plans-message" v-show="updateMealPlans.length == 0">You do not currently have any meal plans.</h1>
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
  computed: {
    updateMealPlans() {
      return this.$store.state.mealPlans;
    }
  },
  methods: {
      getAllFavoriteMealPlans() {
          AccountService.getAllMealPlans().then((response)=>{
              this.$store.commit('SET_MEAL_PLANS', response.data);
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

.empty-meal-plans-message {
  text-align: center;
  font-size: 1.5rem;
  padding: 104px;
}

</style>