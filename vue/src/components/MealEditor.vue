<template>
  <div>
      <h1>{{ meal.name }}</h1>
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
        }
    },
    created() {
        this.retrieveMealByID();
    }

}
</script>

<style>

</style>