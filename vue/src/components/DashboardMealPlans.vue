<template>
  <div>
    <h1>My Meal Plans</h1>

    <meal-plan-card
      v-for="mealPlan in updateMealPlans"
      v-bind:mealPlan="mealPlan"
      v-bind:key="mealPlan.meal_plan_id"
      v-bind:enable-add="true"
    />
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import MealPlanCard from "./MealPlanCard.vue";

export default {
  name: "dashboard-meal-plans",
  components: {
    MealPlanCard,
  },
  data() {
    return {};
  },
  computed: {
    updateMealPlans() {
      return this.$store.state.mealPlans;
    },
  },
  methods: {
    getMealPlans() {
      AccountService.getAllMealPlans().then(response => {
        this.$store.commit("SET_MEAL_PLANS", response.data);
      });
    }
  },
  created() {
    this.getMealPlans();
  }
};
</script>

<style>
</style>