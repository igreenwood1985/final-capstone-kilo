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
  justify-content: flex-start;
  align-items: center;
  flex-direction: column;
  position: absolute;
  padding: 2.95rem;
  height: 42.1rem;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}

</style>