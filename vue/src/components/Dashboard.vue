<template>
  <div>
    <div class="grid-container">
      <h1></h1>
      <h2 class="recipes-title">
        My Favorite Recipes
        <router-link v-bind:to="{ name: 'my-recipes' }">
          <h2 class="my-recipes-link">Click here to view all.</h2>
        </router-link>
      </h2>
      <dashboard-recipes class="recipes-section" />
      <h2 class="mealplans-title">My Meal Plans</h2>
      <dashboard-meal-plans class="meal-plans-section" />
      <h2 class="meals-title">
        My Meals
        <router-link v-bind:to="{ name: 'my-meals' }">
          <h2 class="my-meals-link">Click here to view all.</h2>
        </router-link>
        
        <b-button v-on:click="toggleForm()">Hi</b-button>
        <b-form class="create-meal-form" v-show="createFormToggled">
          <h1>Meal Name</h1>
          <b-input type="text" v-model="meal.mealName"/>
          <h1>Meal Description</h1>
          <b-input type="text" v-model="meal.description" />
          <button class="btn btn-primary" type="reset" v-on:click="createMeal()">Submit</button>
        </b-form>

      </h2>
      <dashboard-meals class="meals-section" />
    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import DashboardMealPlans from "./DashboardMealPlans.vue";
import DashboardMeals from "./DashboardMeals.vue";
// import AccountService from "../services/AccountService.js";
import DashboardRecipes from "./DashboardRecipes.vue";

export default {
  components: { DashboardRecipes, DashboardMealPlans, DashboardMeals },
  data() {
    return {
      createFormToggled: false,
      meal: {
        mealName: "",
        description: ""
      }
    };
  },
  methods: {
    createMeal() {
      AccountService.createMeal(this.formatMeal()).then((response) => {
        return response.status == 200; //change to 201 when server status codes updated
      });
      this.toggleForm();
      this.meal.mealName = "";
      this.meal.description = "";
    },
    formatMeal() {
      const formattedMeal = {
        meal_id: 0,
        name: this.meal.mealName,
        description: this.meal.description,
        user_id: 0,
      };
      console.log(formattedMeal);
      return formattedMeal;
    },
    toggleForm() {
      this.createFormToggled = this.createFormToggled == false ? true : false;
    }
  },
};
</script>

<style>
.grid-container {
  background-color: lightgreen;
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-template-areas:
    "header header"
    "recipes-title mealPlan-title"
    "recipes mealPlan"
    "meals-title mealPlan"
    "meals mealPlan";
}

h1 {
  text-align: center;
  grid-area: header;
}

.recipes-title {
  grid-area: recipes-title;
  border: 2px solid black;
  text-align: center;
}

.meals-title {
  grid-area: meals-title;
  text-align: center;
}

.mealplans-title {
  grid-area: mealPlan-title;
  text-align: center;
}

.recipes-section {
  grid-area: recipes;
  display: flex-end;
  align-items: center;
  justify-content: space-around;
 
}

.meal-plans-section {
  grid-area: mealPlan;

}
.meals-section {
  display: flex-end;
  grid-area: meals;
  
}

.btn {
  background-color: lightgreen;
  border: 2px solid black;
}
.my-recipes-link {

  text-decoration: none;
 
}

</style>