<template>

<div class="page">
      <div class="recipe-details">
      <img class="image" v-if="recipe.recipe.uri" v-bind:src="recipe.recipe.image" />
      <h2>{{recipe.recipe.label}}</h2>
      <!-- <a v-bind:href="recipe.recipe.url">Instructions On How to Make</a> -->
      <h3>{{capitalize(formatArray(recipe.recipe.cuisineType))}} | <span v-if="recipe.recipe.totalTime != 0">{{ recipe.recipe.totalTime }} minutes | </span>{{Math.round(recipe.recipe.calories)}} calories</h3>
      <p><b>Dish Type: </b>{{capitalize(formatArray(recipe.recipe.dishType))}} ({{formatArray(recipe.recipe.dietLabels)}})</p>
      <p><i>*Makes {{recipe.recipe.yield}} servings</i></p>
      <p></p>
      <p><b>Dietary Tags:</b> {{formatArray(recipe.recipe.healthLabels)}}</p>
      <p><b>Ingredients:</b> {{formatArray(recipe.recipe.ingredientLines)}}</p>
      <div>
      </div>
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
        capitalize(string){
            console.log('enter capitalize');
            const firstLetter = string.charAt(0).toUpperCase();
            console.log(firstLetter);
            string = firstLetter + string.substring(1);
            console.log(firstLetter + string.substring(1));
            console.log(string);
            return string;
        },
        formatArray(array){
            let newString = ''

            for (let counter = 0; counter < array.length; counter++) {
                newString += array[counter];
                if (counter < array.length - 1) {
                    newString += ', '
                }
            }

            return newString
        }

    },
    created() {
        this.retrieveRecipeByURI();
    }

}
</script>

<style scoped>

.page {
    background-image: url("../../dashboard-banner.jpg");
    background-position: top;
}
.recipe-details {
    margin: auto;
    width: 50%;
    border: 2px solid #1f2937;
    border-radius: 5px;
    padding: 10px;
    text-align: center;
    background-color: #f5f0f4;
    opacity: .95;
}

.image {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 50%;
    border-radius: 5px;
}
</style>