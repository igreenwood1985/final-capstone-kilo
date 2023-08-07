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
       <div class="search-in-title">
            <input
              type="checkbox"
              name="title"
              id="recipe-title"
              v-bind:value="'strict-title'"
              v-model="activeFilters"
            />
            <label for="title">Search In Recipe Name</label>
      </div>
      <div class="filters" v-show="advancedSearchVisible">
        <div class="left-filters">
          <h4>Dietary Restrictions</h4>
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
            <input 
            type="checkbox" 
            name="egg-free" 
            id="egg-free" 
            v-bind:value="'&health=egg-free'" 
            v-model="activeFilters"
            />
            <label for="title">Egg Free</label>
          </div>
          <div>
            <input 
            type="checkbox" 
            name="fish-free" 
            id="fish-free" 
            v-bind:value="'&health=fish-free'" 
            v-model="activeFilters"
            />
            <label for="title">Fish Free</label>
          </div>
          <div>
            <input 
            type="checkbox" 
            name="gluten-free" 
            id="gluten-free" 
            v-bind:value="'&health=gluten-free'" 
            v-model="activeFilters"
            />
            <label for="gluten-free">Gluten Free</label>
          </div>
          <div>
            <input 
            type="checkbox" 
            name="peanut-free" 
            id="peanut-free" 
            v-bind:value="'&health=peanut-free'" 
            v-model="activeFilters"
            />
            <label for="title">Peanut Free</label>
          </div>
          <div>
            <input 
            type="checkbox" 
            name="pescatarian" 
            id="pescatarian" 
            v-bind:value="'&health=pescatarian'" 
            v-model="activeFilters"
            />
            <label for="title">Pescatarian</label>
          </div>
          <div>
            <input 
            type="checkbox" 
            name="soy-free" 
            id="soy-free" 
            v-bind:value="'&health=soy-free'" 
            v-model="activeFilters"
            />
            <label for="title">Soy Free</label>
          </div>
            <div>
            <input 
            type="checkbox" 
            name="tree-nut-free" 
            id="tree-nut-free" 
            v-bind:value="'&health=tree-nut-free'" 
            v-model="activeFilters"
            />
            <label for="title">Tree Nut Free</label>
          </div>
          <div>
            <input 
            type="checkbox" 
            name="vegan" 
            id="vegan"
            v-bind:value="'&health=vegan'" 
            v-model="activeFilters"
            />
            <label for="vegan">Vegan</label>
          </div>
            <div>
            <input 
            type="checkbox" 
            name="vegetarian" 
            id="vegetarian" 
            v-bind:value="'&health=vegetarian'" 
            v-model="activeFilters"
            />
            <label for="title">Vegetarian</label>
          </div>
        </div>

        <div class="center-filters">
          <h4>Placeholder</h4>
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
          <h4>Placeholder</h4>
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

div h4 {
  text-align: center;
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
  text-align: left;
}


</style>