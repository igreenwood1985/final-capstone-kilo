<template>
  <div class="cards-container">
    <meal-plan-card
      v-for="mealPlan in updateMealPlans"
      v-bind:mealPlan="mealPlan"
      v-bind:key="mealPlan.mealPlanId"
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

<style scoped>
.cards-container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  position: absolute;
  border: 2px solid black;
  padding: 1.4rem;
}

</style>