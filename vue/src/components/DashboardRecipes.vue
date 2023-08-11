<template>
  <div>
    <favorited-card
      v-for="recipe in $store.getters.favorite_recipes"
      v-bind:recipe="recipe"
      v-bind:key="recipe.id"
      v-bind:enable-add="true"
    />
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import FavoritedCard from "./FavoritedCard.vue";
import RecipeService from "../services/RecipeService.js";

export default {
  name: "dashboard-recipes",
  components: {
    FavoritedCard,
  },
  data() {
    return {
      favoriteRecipes: [],
      //componentKey: 0,
    };
  },
  methods: {
    getFavoriteRecipes() {
      AccountService.getDashboardRecipes().then(response => {
        this.$store.commit("SET_FAVORITED_RECIPES", response.data);
      });
    },
    getMealImages() {
      console.log("getting meal images");
      let recipes = this.$store.getters.favorited_recipes;
      console.log('recipes: ' + recipes);
      for (let counter = 0; counter < recipes.length; counter++) {   
        RecipeService.getRecipeByUri(recipes[counter].uri).then(response => {
          recipes[counter].image = response.data.hits[0].recipe.image;
          console.log("found image: " + recipes[counter].image);
        });
      }
      this.$store.commit("SET_FAVORITED_RECIPES", recipes);
    },
    //forceRefresh() {
    //  this.componentKey += 1;
    //},
  },
  created() {
    this.getFavoriteRecipes();
    this.getMealImages();
  },
};
</script>

<style>
.heading {
  display: block;
}
</style>