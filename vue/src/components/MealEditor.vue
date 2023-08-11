<template>
  <div>
      <h1>{{ meal.name }}
          <b-button variant="danger" v-on:click="deleteMeal($store.state.currentMeal)">Delete</b-button>
      </h1>
      <meal-recipe-card
      v-for="recipe in meal.recipes"
      v-bind:recipe="recipe"
      v-bind:key="recipe.id"
      v-bind:enable-add="true"
    />

  </div>
</template>

<script>
import AccountService from '../services/AccountService';
import MealRecipeCard from './MealRecipeCard.vue';

export default {
    name: "meal-editor-component",
    data() {
        return {
            meal: {}
        }
    },
    components: {
        MealRecipeCard
    },
    methods: {
        retrieveMealByID() {
            AccountService.getMealById(this.$route.params.id).then(response => {
                this.meal = response.data;
            });
        },
        deleteMeal(mealId) {
            AccountService.deleteMeal(mealId).then(response => {
                return 200 === response.status;
            })
        }
    },
    created() {
        this.retrieveMealByID();
    }

}
</script>

<style>

</style>