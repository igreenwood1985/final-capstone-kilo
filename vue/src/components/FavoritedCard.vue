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
  <b-dropdown id="dropdown-1" text="Add To Meal" class="m-md-2">
    <b-dropdown-item v-for="meal in meals" v-bind:key="meal.meal_id" v-on:click="addToMeal(meal.meal_id)">{{meal.name}}</b-dropdown-item>
  </b-dropdown>
</div>
    <p>Calories: {{ recipe.calories }}</p>
    <p>Servings: {{ recipe.yield }}</p>
    <p>{{ recipe.totalTime }} minutes</p>

  </div>
  
</template>

<script>
import AccountService from "../services/AccountService.js";

export default {
  name: "favorited-card",
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
  methods: {
    removeFromFavorites() {
      AccountService.removeRecipeFromFavorites(this.recipe.uri).then(response => {
          return 200 === response.status;
      });
      console.log("deleting recipes...")
      this.$store.commit("REMOVE_RECIPE", this.recipe);
    },
    addToMeal(mealId) {
      AccountService.addRecipeToMeal(this.recipe, mealId).then(response => {
        return 201 === response.status;
      });
    },
    getAllMeals() {
      AccountService.getFavoritedMeals().then(response => {
        this.meals = response.data;
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