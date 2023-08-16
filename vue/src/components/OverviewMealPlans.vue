<template>
  <div class="cards-container">
    <meal-plan-card
      v-for="mealPlan in updateMealPlans"
      v-bind:mealPlan="mealPlan"
      v-bind:key="mealPlan.mealPlanId"
      v-bind:enable-add="true"
    />
    <h1 class="empty-meal-plans-message" v-show="updateMealPlans.length == 0">You do not currently have any meal plans.</h1>
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
      return this.$store.state.mealPlans.slice(this.$store.state.mealPlans.length -2).reverse();
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
  justify-content: top;
  align-items: center;
  flex-direction: column;
  position: absolute;
  padding: 2.95rem;
  height: 41.33rem;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}

.empty-meal-plans-message {
  text-align: center;
  font-size: 1.5rem;
  max-width: 22rem;
}

</style>