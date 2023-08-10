<template>
  <div>
    <meal-card
      v-for="meal in this.favoriteMeals"
      v-bind:meal="meal"
      v-bind:key="meal.id"
      v-bind:enable-add="true"
    />
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import MealCard from "../components/MealCard.vue";

export default {
  name: "dashboard-meals",
  components: {
    MealCard,
  },
  data() {
    return {
      favoriteMeals: [],
      componentKey: 0,
    };
  },
  methods: {
    getFavoriteMeals() {
      AccountService.getDashboardMeals().then((response) => {
        this.favoriteMeals = response.data;
      });
    },
    forceRefresh() {
      this.componentKey += 1;
    },
  },
  created() {
    this.getFavoriteMeals();
  },
};
</script>

<style>
.heading {
  display: block;
}
</style>