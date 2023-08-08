<template>
  
  <div>
      <img v-if="recipe.recipe.uri" v-bind:src="recipe.recipe.image" />
      <h2>{{recipe.recipe.label}}</h2>
      <h3>{{formatArray(recipe.recipe.cuisineType)}} | {{recipe.recipe.totalTime}} minutes | {{Math.round(recipe.recipe.calories)}} calories</h3>
      <p>{{formatArray(recipe.recipe.dietLabels)}}</p>
      <p>{{formatArray(recipe.recipe.healthLabels)}}</p>
      <p>{{formatArray(recipe.recipe.ingredientLines)}}</p>
      <p>{{formatArray(recipe.recipe.dishType)}}</p>
      <p>Servings: {{recipe.recipe.yield}}</p>
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
            RecipeService.getRecipeByUri(this.$route.params.id).then(response => {
                this.recipe = response.data.hits[0];
            });
        },
        CapitalizeCuisineType(){
            const firstLetter = this.recipe.recipe.cuisineType[0].charAt[0].toUpperCase()
            this.recipe.recipe.cuisineType = firstLetter + 
            this.recipe.recipe.cuisineType.substring(1)
            console.log(this.recipe.recipe.cuisineType)
        },
        formatArray(array){
            let newString = ''
            array.forEach(element => { 
                newString += element + ', '
                
            });
            return newString
        }

    },
    created() {
        this.retrieveRecipeByURI();
        this.CapitalizeCuisineType();
    }

}
</script>

<style>

</style>