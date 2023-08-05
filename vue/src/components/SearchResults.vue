<template>
  <div>
    <h2>Search for recipes</h2>
    <input class="search-box" type="text" v-model="searchTerm" />
    <button v-on:click="searchForRecipes">Search</button>
    <card
      v-for="recipe in searchResults"
      v-bind:recipe="recipe"
      v-bind:key="recipe.recipe.uri"
      v-bind:enable-add="true"
    />
  </div>
</template>

<script>
import RecipeService from "../services/RecipeService.js";
import Card from "../components/Card.vue";

export default {
  name: "search-results",
  components: {
    Card,
  },
  data() {
    return {
      searchTerm: "",
      searchResults: [],
    };
  },
  methods: {
    searchForRecipes() {
      RecipeService.getRecipes(this.searchTerm).then((response) => {
        this.searchResults = response.data.hits.filter((recipe) => {
          const upperCaseLabel = recipe.recipe.label.toUpperCase();

          return upperCaseLabel.includes(this.searchTerm.toUpperCase(), 0);
        });
        this.$store.commit("SET_SEARCH_RESULTS", this.searchResults);
      });
    },
  },
};
</script>

<style>




</style>