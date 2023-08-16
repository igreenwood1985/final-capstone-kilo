<template>
  <div>
    <favorited-card
      v-for="recipe in updateArray"
      v-bind:recipe="recipe"
      v-bind:key="recipe.id"
      v-bind:enable-add="true"
      v-show="updateArray.length !== 0"
    />
    <h1 class="empty-recipes-message" v-show="updateArray.length == 0">You do not currently have any favorite recipes. <br><br> <router-link :to="{ name : 'search' }"> Add some?</router-link></h1>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import RecipeService from '../services/RecipeService.js';
import FavoritedCard from "./FavoritedCard.vue";

export default {
  name: "my-recipes-component",
  components: {
    FavoritedCard,
  },
  data() {
    return {
      favoriteRecipes: [],
      componentKey: 0,
    };
  },
  computed: {
    updateArray() {
     return this.$store.state.favoritedRecipes;
    }
  },
  methods: {
    getFavoriteRecipes() {
      AccountService.getFavoritedRecipes().then(response => {
        let recipes = response.data;
        // console.log('from database: ' + recipes);
        // for (let counter = 0; counter < recipes.length; counter++) {
        //   console.log('entering for loop...' + recipes[counter]);
        //   recipes[counter].img = this.retrieveNewImageURL(recipes[counter]);
        //   console.log('exiting for loop...' + recipes[counter]);
        // }
        this.$store.commit("SET_FAVORITED_RECIPES", recipes);
      });
    },
    //forceRefresh() {
    //  this.componentKey += 1;
    //},
    retrieveNewImageURL(recipe) {
      RecipeService.getRecipeByUri(recipe.uri).then(response => {
        console.log('from api: ' + response.data);
        return recipe.img = response.data.hits[0].recipe.image;
      });      
    }
  },
  created() {
    this.getFavoriteRecipes();
  },
};
</script>

<style>
.empty-recipes-message {
  text-align: center;
  font-size: 1.5rem;
  padding: 104px
}
</style>