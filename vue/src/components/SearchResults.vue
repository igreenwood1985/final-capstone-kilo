<template>
  <div>
    <div class="search-section">
      <div class="call-and-block">
        <!-- <h2>
          <img
            src="../../search-logo.png"
            alt="An image of a chef's hat."
            class="search-logo"
          />
        </h2> -->
        <b-input-group size="lg">
          <b-form-input
            class="search-box"
            placeholder="Find your next meal here..."
            v-model="searchTerm"
            v-on:keydown.enter="chooseSearch()"
          ></b-form-input>

          <b-input-group-append>
            <b-button
              size="lg"
              v-show="advancedSearchVisible === false"
              v-on:click="searchForRecipes"
              >⌕‍
            </b-button>

            <b-button
              size="lg"
              v-show="advancedSearchVisible"
              v-on:click="searchByFilters"
              >⌕‍
            </b-button>
          </b-input-group-append>
        </b-input-group>
        <!-- <input class="search-box" type="text" placeholder="Find your next meal..." v-model="searchTerm" /> -->
        <!-- <button
          v-show="advancedSearchVisible === false"
          v-on:click="searchForRecipes"
        >
          Search
        </button>
        <button v-show="advancedSearchVisible" v-on:click="searchByFilters">
          Search
        </button> -->
        <br />
        <br />
        <a 
          style="color: white;"
          class = "advanced-search"
          id="advanced-search"
          href=""
          v-on:click.prevent="toggleAdvancedSearch()"
          >Advanced Search</a
        >
        <!-- <div class="search-in-title">
          <input
            type="checkbox"
            name="title"
            id="recipe-title"
            v-bind:value="'strict-title'"
            v-model="activeFilters"
          />
          <label for="title">Search In Recipe Name</label>
        </div> -->

        <div class="filters" v-show="advancedSearchVisible">
          <div class="left-filters">
            <h4 class="filter-title">Dietary Restrictions</h4>
            <div>
              <input
                type="checkbox"
                name="dairy-free"
                id="dairy-free"
                v-bind:value="'&health=dairy-free'"
                v-model="activeFilters"
              />
              <label for="dairy-free">Dairy Free</label>
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
            <h4 class="filter-title">Diet Type</h4>
            <div>
              <input
                type="checkbox"
                name="balanced"
                id="balanced"
                v-bind:value="'&diet=balanced'"
                v-model="activeFilters"
              />
              <label for="balanced">Balanced</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="high-fiber"
                id="high-fiber"
                v-bind:value="'&diet=high-fiber'"
                v-model="activeFilters"
              />
              <label for="high-fiber">High Fiber</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="high-protein"
                id="high-protein"
                v-bind:value="'&diet=high-protein'"
                v-model="activeFilters"
              />
              <label for="high-protein">High Protein</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="immuno-supportive"
                id="immuno-supportive"
                v-bind:value="'&health=immuno-supportive'"
                v-model="activeFilters"
              />
              <label for="immuno-supportive">Immuno Supportive</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="keto-friendly"
                id="keto-friendly"
                v-bind:value="'&health=keto-friendly'"
                v-model="activeFilters"
              />
              <label for="keto-friendly">Keto Friendly</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="low-carb"
                id="low-carb"
                v-bind:value="'&diet=low-carb'"
                v-model="activeFilters"
              />
              <label for="low-carb">Low Carb</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="low-fat"
                id="low-fat"
                v-bind:value="'&diet=low-fat'"
                v-model="activeFilters"
              />
              <label for="low-fat">Low Fat</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="low-sodium"
                id="low-sodium"
                v-bind:value="'&diet=low-sodium'"
                v-model="activeFilters"
              />
              <label for="low-sodium">Low Sodium</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="paleo"
                id="paleo"
                v-bind:value="'&health=paleo'"
                v-model="activeFilters"
              />
              <label for="paleo">Paleo</label>
            </div>
            <div>
              <input
                type="checkbox"
                name="sugar-conscious"
                id="sugar-conscious"
                v-bind:value="'&health=sugar-conscious'"
                v-model="activeFilters"
              />
              <label for="sugar-conscious">Sugar Conscious</label>
            </div>
          </div>

          <div class="right-filters">
            <div class="right-top-filters">
              <h4 class="filter-title">Meal Type</h4>
              <div>
                <input
                  type="checkbox"
                  name="breakfast"
                  id="breakfast"
                  v-bind:value="'&mealType=breakfast'"
                  v-model="activeFilters"
                />
                <label for="title">Breakfast</label>
              </div>
              <div>
                <input
                  type="checkbox"
                  name="lunch"
                  id="lunch"
                  v-bind:value="'&mealType=lunch'"
                  v-model="activeFilters"
                />
                <label for="lunch">Lunch</label>
              </div>
              <div>
                <input
                  type="checkbox"
                  name="dinner"
                  id="dinner"
                  v-bind:value="'&mealType=dinner'"
                  v-model="activeFilters"
                />
                <label for="dinner">Dinner</label>
              </div>
              <div>
                <input
                  type="checkbox"
                  name="snack"
                  id="snack"
                  v-bind:value="'&mealType=snack'"
                  v-model="activeFilters"
                />
                <label for="snack">Snack</label>
              </div>
              <!-- <div>
              <input
                type="checkbox"
                name="teatime"
                id="teatime"
                v-bind:value="'&mealType=teatime'"
                v-model="activeFilters"
              />
              <label for="teatime">Teatime</label>
            </div> -->
            </div>
            <div class="right-top-filters">
              <h4 class="filter-title">Calorie Range</h4>
              <div>
                <input
                  type="checkbox"
                  name="0-250-cals"
                  id="0-250-cals"
                  v-bind:value="'&calories=0-250'"
                  v-model="activeFilters"
                />
                <label for="0-250-cals">0 - 250</label>
              </div>
              <div>
                <input
                  type="checkbox"
                  name="250-500-cals"
                  id="250-500-cals"
                  v-bind:value="'&calories=250-500'"
                  v-model="activeFilters"
                />
                <label for="250-500-cals">250 - 500</label>
              </div>
              <div>
                <input
                  type="checkbox"
                  name="500-750-cals"
                  id="500-750-cals"
                  v-bind:value="'&calories=500-750'"
                  v-model="activeFilters"
                />
                <label for="500-750-cals">500 - 750</label>
              </div>
              <div>
                <input
                  type="checkbox"
                  name="750-1000-cals"
                  id="750-1000-cals"
                  v-bind:value="'&calories=750-1000'"
                  v-model="activeFilters"
                />
                <label for="750-1000-cals">750 - 1000</label>
              </div>
              <div>
                <div>
                  <input
                    type="checkbox"
                    name="1000-plus-cals"
                    id="1000-plus-cals"
                    v-bind:value="'&calories=1000+'"
                    v-model="activeFilters"
                  />
                  <label for="1000-plus-cals">1000+</label>
                </div>
              </div>
              <div>
                <!-- <button
               
                name="custom-calorie-range"
                id="custom-calorie-range"
                v-on:click="addCalorieRange()"
                
                > 
                Set Range </button>

              
              <input
                type="number"
                name="minimum-range"
                id="minimum-range"
                v-model="minimumCalories"
                class="input-text"
              />
              <input
                type="number"
                name="maximum-range"
                id="maximum-range"
                v-model="maximumCalories"
                class="input-text"
                
              /> -->
              </div>
            </div>
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
        class="display-card"
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
      advancedSearchVisible: false,
      activeFilters: [],
      minimumCalories: "",
      maximumCalories: "",
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
        } else {
          this.searchResults = response.data.hits;
        }
        this.$store.commit("SET_SEARCH_RESULTS", this.searchResults);
      });
    },
    chooseSearch() {
      if (this.advancedSearchVisible === false) {
        return this.searchForRecipes();
      } else {
        return this.searchByFilters();
      }
    },
    addCalorieRange() {
      const calorieFilter =
        "&calories=" + this.minimumCalories + "-" + this.maximumCalories;
      this.activeFilters = this.activeFilters.filter((item) => {
        return item.includes("&calories") == false;
      });
      this.activeFilters.push(calorieFilter);
    },
  },
};
</script>

<style>
.search-section {
  display: block;
  text-align: center;
  padding-top: 110px;
  padding-bottom: 50px;
  background-image: url("../../search-wallpaper.jpg");
  min-height: 44vh;
  border: 1px solid black;
}
.call-and-block {
  border: 2px solid black;
  background-color: #1F2937;
  max-width: 50%;
  margin: auto;
  padding: 25px;
  border-radius: 20px;
}

div h4 {
  text-align: center;
}

.cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
  align-items: center;
  background-color: aliceblue;
}

.display-card {
  margin-top: 30px;
}

.filters {
  display: flex;
  justify-content: space-between;
  align-items: top;
  flex-direction: row;
  background-color: white;
  margin-top: 10px;
  padding: 10px;
  text-align: left;
  width: 100%;
}

.left-filters,
.right-filters,
.center-filters {
  flex-basis: auto;
}

.filter-title {
  font-size: 18px;
  text-decoration: underline;
  text-align: left;
}

label {
  padding-left: 5px;
}

.input-text {
  max-width: 20%;
  max-height: 25px;
  margin: 2px;
}

h2 {
  padding: 0px;
}

/* .search-logo {
  max-width: 30%;
  margin: 0px;
  padding: 0px;
} */
</style>