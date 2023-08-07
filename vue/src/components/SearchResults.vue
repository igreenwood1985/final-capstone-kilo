<template>
  <div>
    <div class="search-section">
      <h2>Search for recipes</h2>
      <input class="search-box" type="text" v-model="searchTerm" />
      <button v-show="advancedSearchVisible === false" v-on:click="searchForRecipes">Search</button>
      <button v-show="advancedSearchVisible" v-on:click="searchByFilters">Search</button> 
      <br />
      <br />
      <a
        id="advanced-search"
        href=""
        v-on:click.prevent="toggleAdvancedSearch()"
        >Advanced Search</a
      >

      <div class="filters" v-show="advancedSearchVisible">
        <div class="left-filters">
          <div>
            <input
              type="checkbox"
              name="title"
              id="recipe-title"
              v-bind:value="'strict-title'"
              v-model="activeFilters"
            />
            <label for="title">Search In Recipe Name</label>
          </div>
          <div>
            <input
              type="checkbox"
              name="dairy-free"
              id="dairy-free"
              v-bind:value="'&health=dairy-free'"
              v-model="activeFilters"
            />
            <label for="dairy-free">Dairy-Free</label>
          </div>
          <div>
            <input type="checkbox" name="title" id="recipe-title" />
            <label for="title">Recipe Must Have Search Term In Title</label>
          </div>
        </div>

        <div class="center-filters">
          <div>
            <input type="checkbox" name="title" id="recipe-title" />
            <label for="title">Recipe Must Have Search Term In Title</label>
          </div>
          <div>
            <input type="checkbox" name="title" id="recipe-title" />
            <label for="title">Recipe Must Have Search Term In Title</label>
          </div>
          <div>
            <input type="checkbox" name="title" id="recipe-title" />
            <label for="title">Recipe Must Have Search Term In Title</label>
          </div>
        </div>

        <div class="right-filters">
          <div>
            <input type="checkbox" name="title" id="recipe-title" />
            <label for="title">Recipe Must Have Search Term In Title</label>
          </div>
          <div>
            <input type="checkbox" name="title" id="recipe-title" />
            <label for="title">Recipe Must Have Search Term In Title</label>
          </div>
          <div>
            <input type="checkbox" name="title" id="recipe-title" />
            <label for="title">Recipe Must Have Search Term In Title</label>
          </div>
        </div>
      </div>

    </div>

    <div class="cards">
      <card
        v-for="recipe in searchResults"
        v-bind:recipe="recipe"
        v-bind:key="recipe.recipe.uri"
        v-bind:enable-add="true"
      />
    </div>
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
      advancedSearchVisible: true,
      activeFilters: [],
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
    toggleAdvancedSearch() {
      this.advancedSearchVisible =
        this.advancedSearchVisible === false ? true : false;
    },
    searchByFilters() {
      RecipeService.getFilteredRecipes(
        this.searchTerm,
        this.activeFilters
      ).then((response) => {
        if (this.activeFilters.includes("strict-title")) {
        this.searchResults = response.data.hits.filter((recipe) => {
            const upperCaseLabel = recipe.recipe.label.toUpperCase();
            return upperCaseLabel.includes(this.searchTerm.toUpperCase(), 0);
        });
      }
      else {
        this.searchResults = response.data.hits;
      }
        this.$store.commit("SET_SEARCH_RESULTS", this.searchResults);
      });
    },
  },
};
</script>

<style>
.search-section {
  display: block;
  text-align: center;
  border: 2px solid black;
  padding-top: 10px;
  padding-bottom: 50px;
}

.cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
}

.filters {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-direction: row;
  background-color: lightsteelblue;
  padding-top: 10px;
  padding-bottom: 10px;
}

.left-filters {
  text-align: left;
}
</style>