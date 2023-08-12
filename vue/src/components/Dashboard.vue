<template>
  <div class="entire-page">
    <div class="grid-container">
      <div class="heading"></div>
      <h1 class="greeting">Welcome to your Dashboard</h1>
      <div class="recipes-heading">
        <h2 class="recipes-title">
          My Favorite Recipes
          <!-- <router-link v-bind:to="{ name: 'my-recipes' }">
            <h2 class="my-recipes-link">Click here to view all.</h2>
          </router-link> -->
        </h2>
      </div>

      <div class="recipes-here">
        <dashboard-recipes class="recipes-section" />
      </div>

      <h2 class="mealplans-title">My Meal Plans</h2>
      <dashboard-meal-plans class="meal-plans-section" />
      <h2 class="meals-title">
        My Meals
        <router-link v-bind:to="{ name: 'my-meals' }">
          <h2 class="my-meals-link">Click here to view all.</h2>
        </router-link>

        <b-button v-on:click="toggleForm()">Create New Meal</b-button>
        <b-form class="create-meal-form" v-show="createFormToggled">
          <h1>Meal Name</h1>
          <b-input type="text" v-model="meal.mealName" />
          <h1>Meal Description</h1>
          <b-input type="text" v-model="meal.description" />
          <button
            class="btn btn-primary"
            type="reset"
            v-on:click="createMeal()"
          >
            Submit
          </button>
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
        description: "",
      },
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
    },
  },
};
</script>

<style>
.recipes-here {
  border: 2px solid black;
  width: 45rem;
  margin-left: 4rem;
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
    "greeting mealPlan-title"
    "recipes-heading mealPlan"
    "recipes mealPlan"
    "meals-title mealPlan"
    "meals mealPlan";
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
  max-width: 40rem;
  margin-left: 2rem;
  margin-top: 2rem;
  grid-area: greeting;
}

.recipes-heading {
  grid-area: recipes-heading;
  background-color: lightslategray;
  text-align: center;
  width: 45rem;
  margin-left: 4rem;
  margin-top: 2rem;
  border-top-right-radius: 20px;
  border-top-left-radius: 20px;
}

.recipes-title {
  color: white;
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
  border: 2px solid black;
}

.meal-plans-section {
  border: 2px solid black;
  grid-area: mealPlan;
  background-color: royalblue;
}
.meals-section {
  border: 2px solid black;
  display: flex-end;
  grid-area: meals;
  background-color: sandybrown;
}

.btn {
  background-color: lightgreen;
  border: 2px solid black;
}

.my-recipes-link {
  text-decoration: none;
}
</style>