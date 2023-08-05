<template>
  
  <div>
    <h2>Search for recipes</h2>
    <input class="search-box" type="text" v-model="searchTerm" />
    <button v-on:click="searchForRecipes" >Search</button>
  </div>

</template>

<script>
import RecipeService from '../services/RecipeService.js';

export default {
    name: 'search-results',
    data() {
        return {
            searchTerm: '',
            searchResults: []
        }
    },
    methods: {

        searchForRecipes() {
            RecipeService.getRecipes(this.searchTerm).then(response => {
                this.searchResults = response.data.hits;
                console.log('searchedForRecipes');
            });

        }
    }

}
</script>

<style>

</style>