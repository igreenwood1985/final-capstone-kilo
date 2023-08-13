<template>
  <div class="main">
    <!-- <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}"> -->
    <!-- <h2 class="recipe-name">{{ recipe.label }}</h2> -->
    <!-- </router-link> -->
    <div class="card-container">
      <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}" title="View Recipe Details">
      <img v-bind:src="recipe.img" id="image" />
      <div class="centered">{{recipe.label}}</div>
      </router-link>
      <div class="top-right"><span class="minus" v-on:click="removeFromFavorites()" title="Remove from Favorites" style="cursor: pointer">-</span></div>
    </div>
        <div class="add-to-meal-dropdown">
      <b-dropdown id="dropdown-1" text="Add To Meal" variant="light" class="m-md-2">
        <b-dropdown-item v-for="meal in meals" v-bind:key="meal.meal_id" v-on:click="addToMeal(meal.meal_id)">{{meal.name}}</b-dropdown-item>
      </b-dropdown>
    </div>
    
    <!-- <span v-on:click="removeFromFavorites()" class="minus bg-dark">-</span>

    <h2 class="recipe-name">{{ recipe.label }}</h2>
    </router-link>
    <hr />
    <div class="recipe-info-grouping">
      <h6 class="recipe-info-label">Cook:</h6>
      <h6 class="recipe-info">{{recipe.totalTime}} minutes</h6>
    </div>
    <div class="recipe-info-grouping">
      <h6 class="recipe-info-label">Calories:</h6>
      <h6 class="recipe-info">{{recipe.calories}} <br />({{Math.round(recipe.calories/recipe.yield)}} calories/person)</h6>
    </div>
    <div class="recipe-info-grouping">
      <h6 class="recipe-info-label">Servings:</h6>
      <h6 class="recipe-info">{{recipe.yield}}</h6>
    </div>
    <b-button class="bi bi-file-minus" v-on:click="removeFromFavorites()" >
      Unfavorite</b-button> -->
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
      meals: [],
      hover: false
    };
  },
  methods: {
    removeFromFavorites() {
      AccountService.removeRecipeFromFavorites(this.recipe.uri).then(
        (response) => {
          if (response.status !== 200) {
            this.$store.commit("REMOVE_RECIPE", this.recipe);
          }
        }
      );
    },
    addToMeal(mealId) {
      AccountService.addRecipeToMeal(this.recipe, mealId).then((response) => {
        return 201 === response.status;
      });
    },
    getAllMeals() {
      AccountService.getFavoritedMeals().then((response) => {
        this.meals = response.data;
      });
    },
    capitalize(string) {
      console.log("enter capitalize");
      const firstLetter = string.charAt(0).toUpperCase();
      console.log(firstLetter);
      string = firstLetter + string.substring(1);
      console.log(firstLetter + string.substring(1));
      console.log(string);
      return string;
    },
  },
  created() {
    this.getAllMeals();
  },
};
</script>

<style scoped>
.main {
  border-radius: 10px;
  display: inline-block;
  width: 200px;
  height: 16rem;
  margin: 20px;
  background-color: #F8F9FA;
  border: 2px solid black;
  overflow: hidden;
}

.recipe-info-grouping {
  display: flex;
  justify-content: space-around;
}

.recipe-info-label {
  text-align: left;
}

.recipe-info {
  text-align: right;
}

.main .recipe-name {
  font-size: 1.2rem;
  text-align: center;
}

.main .time-to-make {
  font-size: 1rem;
}

.minus {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  width: 15px;
  height: 15px;
  font-size: 10px;
  text-align: center;
  border-radius: 50%;
  background-color: rgba(255, 0, 0, 0.658);
  border: 1px solid black;
}


.card-container {
  position: relative;
  text-align: center;
}

.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 1.25rem;
  font-weight: 700;
  color: white;
  backdrop-filter: blur(4.5px);
  width: 99%;
  height: 50%;
  border-radius: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.bottom-right {
  position: absolute;
  bottom: 8px;
  right: 16px;
}

.top-right {
  position: absolute;
  top: 5px;
  right: 20px;
}

.add-to-meal-dropdown {
  margin-left: 1.5rem;
  position: absolute;
}

</style>