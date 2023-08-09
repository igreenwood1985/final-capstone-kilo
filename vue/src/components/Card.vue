<template>
  <!-- <router-link v-bind:to="{ name: 'recipe', params: { uri: recipe.recipe.uri } }"> -->
  <div class="card" v-bind:class="{ favorited: favorited }">
    <img v-if="recipe.recipe.uri" v-bind:src="recipe.recipe.image" />
    <h2 class="recipe-name">{{ recipe.recipe.label }}</h2>
    <button v-if="$store.state.token != '' && favorited === false" v-on:click="addToFavorites">
      Favorite
    </button>
    <button v-if="$store.state.token != '' && favorited" v-on:click="removeFromFavorites">Unfavorite</button>
    <h3 class="time-to-make">{{ recipe.recipe.totalTime }}</h3>
    <p class="calories">{{ recipe.recipe.calories }}</p>
    <p class="cuisine-type">{{ recipe.recipe.cuisineType }}</p>
    <p class="tags">{{ combineHealthAndDietaryTags() }}</p>
  </div>
</template>

<script>
import AccountService from "../services/AccountService.js";

export default {
  name: "card",
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
      favorited: false,
    };
  },
  methods: {
    combineHealthAndDietaryTags() {
      return this.recipe.recipe.healthLabels.concat(
        this.recipe.recipe.dietLabels
      );
    },
    addToFavorites() {
      AccountService.addRecipeToFavorites(this.formatRecipe()).then((response) => {
        return response.status == 200 //change to 201 when server status codes updated
      });
      this.favorited = true;
    },
    removeFromFavorites() {
      console.log("entered removal function");
      AccountService.removeRecipeFromFavoritesByUri(this.recipe.recipe.uri).then(response => {
        console.log("removal in process");
        return response.status == 200;
      });
      this.favorited = false;
    },
    formatRecipe() {
      const formattedRecipe = {
        recipe_id: 0,
        uri: this.recipe.recipe.uri,
        label: this.recipe.recipe.label,
        img: this.recipe.recipe.image,
        calories: Math.round(this.recipe.recipe.calories),
        yield: this.recipe.recipe.yield,
        cuisineType: this.recipe.recipe.cuisineType[0],
        totalTime: this.recipe.recipe.totalTime
      };
      console.log(formattedRecipe);
      return formattedRecipe;
    }
  },
};
</script>

<style>
.card {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 275px;
  height: 600px;
  margin: 20px;
}

.card.read {
  background-color: lightgray;
}

.card img {
  max-width: 75%;
  height: auto;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.card .recipe-name {
  font-size: 1.2rem;
  text-align: center;
}

.card .time-to-make {
  font-size: 1rem;
}

.favorited {
  background-color: yellow;
  border: 10px solid black;
}
</style>