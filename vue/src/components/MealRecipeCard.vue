<template>

  <div class="main ">
    <!-- <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}"> -->
     <!-- <h2 class="recipe-name">{{ recipe.label }}</h2> -->
    <!-- </router-link> -->

    <img v-bind:src="recipe.img" id="image" />
    <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}">
    <h2 class="recipe-name">{{ recipe.label }}</h2>
    </router-link>
    <p>Cuisine Type: {{recipe.cuisineType}}</p>
    <button v-on:click="removeFromFavorites()">Unfavorite</button>
    <div>
  <button v-on:click="removeRecipeFromMeal($store.state.currentMeal)">Remove from Meal</button>
</div>
    <p>Calories: {{ recipe.calories }}</p>
    <p>Servings: {{ recipe.yield }}</p>
    <p>{{ recipe.totalTime }} minutes</p>

  </div>
  
</template>

<script>
import AccountService from "../services/AccountService.js";

export default {
  name: "meal-recipe-card",
  props: {
    recipe: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      healthTags: "",
      meals: []
    };
  },
  computed: {
    currentMealId() {
      return this.$store.getters
    }
  },
  methods: {
    removeFromFavorites() {
      AccountService.removeRecipeFromFavorites(this.recipe.uri).then(response => {
          return 200 === response.status;
      });
    },
    // addToMeal(mealId) {
    //   AccountService.addRecipeToMeal(this.recipe.id, mealId).then(response => {
    //     return 201 === response.status;
    //   });
    // },
    getAllMeals() {
      AccountService.getFavoritedMeals().then(response => {
        this.meals = response.data;
      })
    },
    removeRecipeFromMeal(mealId) {
      AccountService.removeRecipeFromMeal(this.recipe.recipe_id, mealId).then(response => {
        return 204 === response.status
      })
    }
  },
  created() {
    this.getAllMeals();
  }
};

</script>

<style>
.main {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 275px;
  height: 400px;
  margin: 20px;
  background-color: white;
  overflow: hidden;
}




.main .recipe-name {

  font-size: 1.2rem;
  text-align: center;
}

.main .time-to-make {
  font-size: 1rem;
}

#image {
   width: 100%; 
   height: 50%;
}
</style>