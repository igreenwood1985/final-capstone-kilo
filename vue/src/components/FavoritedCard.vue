<template>
  <div class="card">
    <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}">
      <h2 class="recipe-name">{{ recipe.label }}</h2>
    </router-link>
    <img v-bind:src="recipe.img"/>
    <p>Cuisine Type: {{recipe.cuisineType}}</p>
    <button v-on:click="removeFromFavorites()">Unfavorite</button>
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
    };
  },
  methods: {
    removeFromFavorites() {
      AccountService.removeRecipeFromFavorites(this.recipe.recipe_id).then(response => {
          return 200 === response.status;
      });
      this.$store.commit("REMOVE_RECIPE", this.recipe);
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
</style>