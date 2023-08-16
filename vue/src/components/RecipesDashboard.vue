<template>
  <div class="entire-page">
    <div class="grid-container">
      <div class="heading"></div>
      <h1 class="greeting">
        <h5>
          Logged in as <b>{{ $store.state.user.username }}</b>
        </h5>
        My Dashboard
        <span class="nav-text"
          ><router-link
            :to="{ name: 'dashboard' }"
            >Overview</router-link
          >
          ∙
          <router-link
          :to="{name:'my-recipes'}" 
          class="current-page-selection"
          >Recipes</router-link> ∙<router-link
          :to="{name:'my-meals'}">
          
           My Meals</router-link> ∙<router-link
           :to="{name: 'my-meal-plans'}"> Meal Plans</router-link></span>
        
      </h1>

        <div class="recipes-container">
            <div class="recipes-heading">
                <h2 class="recipes-title">
               My Recipes
                </h2>
            </div>

            <div class="recipes-here">
                <my-recipes class="recipes-section" />
            </div>
        </div>
    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import MyRecipes from "./MyRecipes.vue";

export default {
    name: 'recipes-dashboard',
  components: {
      MyRecipes
      },
  data() {
    return {
      createFormToggled: false,
      meal: {
        mealName: "",
        description: "",
      },
    };
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
  },
};
</script>

<style scoped>
.mealplans-here {
  width: 28rem;
  margin-right: 3.25rem;
  margin-top: 0;
}

.entire-page {
  display: block;
  background-color: #1f2937;
  font-family: bitter;
}
.grid-container {
  background-color: white;
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-template-areas:
    "header header"
    "greeting greeting"
    "recipes-heading recipes-heading"
    "recipes recipes";
  width: 88%;
  margin: auto;
}

.heading {
  text-align: center;
  grid-area: header;
  border-bottom: 0.5px solid #1f2937;
  background-image: url("../../dashboard-banner.jpg");
  background-position: center;
  height: 20rem;
  border-bottom-left-radius: 2px;
  border-bottom-right-radius: 2px;
  border-top-right-radius: 1px;
  border-top-left-radius: 1px;
}

.greeting {
  display: inline-block;
  color: black;
  text-align: left;
  max-width: 95%;
  margin-left: 2rem;
  margin-top: 2rem;
  grid-area: greeting;
  padding-bottom: 2px;
  border-bottom: 1px solid gray;
}

.nav-text {
  font-size: 1.25rem;
  margin-left: 1rem;
}

.nav-text a {
  color: black;
  text-decoration: none;
}

.recipes-heading {
  grid-area: recipes-heading;
  background-color: #5194f7;
  text-align: center;
  width: 76rem;
  height: 3.2rem;
  margin-left: 3.25rem;
  margin-top: 2rem;
  border: 1px solid black;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
}

.recipes-section {
  grid-area: recipes; 
  background: aliceblue;
  width: 76rem;
  margin-left: 3.25rem;
  border-bottom: 1px solid black;
  border-left: 1px solid black;
  border-right: 1px solid black;
  border-bottom-right-radius: 10px;
  border-bottom-left-radius: 10px;
  margin-bottom: 2.45rem;
}

.recipes-title,
.mealplans-title,
.meals-title {
  color: white;
  padding: 0.25rem;
}

.recipes-heading a,
.meals-heading a {
  text-decoration: none;
}

.my-recipes-link,
.my-meals-link {
  color: white;
  font-size: 1rem;
}

.my-recipes-link:hover {
  text-decoration: underline;
}




.btn {
  background-color: lightgreen;
  border: 2px solid black;
}

.current-page-selection {
  font-weight: 700;
}



</style>