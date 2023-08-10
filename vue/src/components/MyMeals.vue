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
import MealCard from "./MealCard.vue";

export default {
  name: "my-meals-component",
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
    getAllFavoriteMeals() {
      AccountService.getFavoritedMeals().then((response) => {
        this.favoriteMeals = response.data;
      });
    },
    forceRefresh() {
      this.componentKey += 1;
    },
  },
  created() {
    this.getAllFavoriteMeals();
  },
};
</script>

<style>
.heading {
  display: block;
}
</style>