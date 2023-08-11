<template>

  <div class="main ">
    <!-- <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}"> -->
     <!-- <h2 class="recipe-name">{{ recipe.label }}</h2> -->
    <!-- </router-link> -->

    <img v-bind:src="recipe.img" id="image" />
    <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}">
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
    <b-button class="bi bi-file-minus" v-on:click="removeFromFavorites()">
      Unfavorite</b-button>
    <div>
      <b-dropdown id="dropdown-1" text="Add To Meal" class="m-md-2">
        <b-dropdown-item v-for="meal in meals" v-bind:key="meal.meal_id" v-on:click="addToMeal(meal.meal_id)">{{meal.name}}</b-dropdown-item>
      </b-dropdown>
    </div>
    
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
    }
  },
  created() {
    this.getAllMeals();
  }
};

</script>

<style scoped>
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


.main {
  height: 35rem;
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

#image {
   width: 100%;
   height: 50%;
}
</style>