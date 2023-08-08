<template>
  
  <div>
      <img v-if="recipe.recipe.uri" v-bind:src="recipe.recipe.image" />
      <h2>{{recipe.recipe.label}}</h2>
      <h3>{{recipe.recipe.cuisineType}} | {{totalTime}} minutes | {{calories}} calories</h3>
      <div>

      </div>
  </div>

</template>

<script>
import RecipeService from '../services/RecipeService.js';

export default {
    name: 'recipe_details',
    data() {
        return {
            recipe: ''
        }
    },
    methods: {
        retrieveRecipeByURI() {
            RecipeService.getRecipeByUri().then(response => {
                this.recipe = response.data.hits[0];
            });
        }

    },
    created() {
        this.retrieveRecipeByURI();
    }

}
</script>

<style>

</style>