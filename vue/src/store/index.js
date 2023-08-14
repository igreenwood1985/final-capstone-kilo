import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    searchResults: [],
    currentMeal: 0,
    favoritedRecipes: [],
    meals: [],
    mealPlans: []
  },
  getters: {
    favorite_recipes(state) {
      return state.favoritedRecipes
    }
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_SEARCH_RESULTS(state, searchResults){
      state.searchResults = searchResults;
    },
    SET_FAVORITED_RECIPES(state, recipes) {
      console.log("entering the store");
      state.favoritedRecipes = recipes;
    },
    ADD_RECIPE (state, recipe) {
      state.favoritedRecipes.push(recipe);
    },
    REMOVE_RECIPE(state, recipeToRemove) {
      console.log("leaving the store");
      const recipeIndex = state.favoritedRecipes.indexOf(recipeToRemove);
      state.favoritedRecipes.splice(recipeIndex, 1);
    },
    SET_CURRENT_MEAL(state, mealId) {
      state.currentMeal = mealId;
    },
    SET_MEAL_NAME(state, meal, enteredMealName) {
      console.log(meal.name);
      console.log(meal.meal_id);
      console.log(enteredMealName);
    },
    SET_MEALS(state, meals) {
      state.meals = meals;
    },
    ADD_MEAL(state, newMeal) {
      state.meals.push(newMeal);
    },
    ADD_RECIPE_TO_MEAL(state, recipe, mealID) {
      console.log("adding recipe in store");
      const mealIndex = state.meals.findIndex(meal => {
        
        return meal.meal_id = mealID;
      });
      state.meals[mealIndex].recipes.push(recipe);
    },
    // REMOVE_RECIPE_FROM_MEAL(state, recipeID, mealID) {
    //   const mealIndex = state.meals.findIndex(meal => {
    //     return meal.meal_id == mealID;
    //   });
    //   const recipeIndex = state.meals[mealIndex].recipes.findIndex(recipe => {
    //     return recipe.recipe_id == recipeID;
    //   });
    //   state.meals[mealIndex].recipes.splice(recipeIndex, 1);
    // },
    REMOVE_MEAL(state, mealToRemove) {
      const mealIndex = state.favoritedRecipes.indexOf(mealToRemove);
      state.favoritedRecipes.splice(mealIndex, 1);
    },
    SET_MEAL_PLANS(state, mealPlans) {
      state.mealPlans = mealPlans;
    },
    ADD_MEAL_PLAN(state, mealPlan) {
      state.mealPlans.push(mealPlan);
    },
    REMOVE_MEAL_PLAN(state, mealPlanToRemove) {
      const mealPlanIndex = state.mealPlans.indexOf(mealPlanToRemove);
      state.mealPlans.splice(mealPlanIndex, 1);
    }
  }
})
