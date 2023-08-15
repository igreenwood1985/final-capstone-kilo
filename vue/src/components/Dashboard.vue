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
            class="current-page-selection"
            >Overview</router-link
          >
          ∙ Favorited Recipes ∙ My Meals ∙ Meal Plans</span
        >
      </h1>

      <div class="recipes-heading">
        <h2 class="recipes-title">
          My Latest Recipes
          <router-link v-bind:to="{ name: 'my-recipes' }">
            <h2 class="my-recipes-link">(View All)</h2>
          </router-link>
        </h2>
      </div>

      <div class="recipes-here">
        <dashboard-recipes class="recipes-section" />
      </div>

      <div class="mealplans-heading">
        <h2 class="mealplans-title">My Meal Plans</h2>
      </div>

      <div class="mealplans-here">
        <dashboard-meal-plans class="meal-plans-section" />
      </div>

      <div class="meals-heading">
        <h2 class="meals-title">
          My Meals
          <div class="create-meal-box">
            <img
            src="https://thenounproject.com/api/private/icons/2251528/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0"
            alt=""
            class="create-meal-btn"
          />
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
          </div>
          
          <router-link v-bind:to="{ name: 'my-meals' }">
            <h2 class="my-meals-link">Click here to view all.</h2>
          </router-link>

          
        </h2>
      </div>

      <dashboard-meals class="meals-section" />
    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import DashboardMealPlans from "./DashboardMealPlans.vue";
import DashboardMeals from "./DashboardMeals.vue";
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
    "recipes-heading mealPlans-heading"
    "recipes mealPlan"
    "meals-heading mealPlan"
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
  width: 46rem;
  height: 4.2rem;
  margin-left: 3.25rem;
  margin-top: 2rem;
  border: 1px solid black;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
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

.meals-heading {
  grid-area: meals-heading;
  background-color: #f75151;
  text-align: center;
  width: 46rem;
  height: 4.2rem;
  margin-left: 3.25rem;
  margin-top: 2.5rem;
  border: 1px solid black;
  border-top-right-radius: 20px;
  border-top-left-radius: 20px;
}

.mealplans-heading {
  grid-area: mealPlans-heading;
  background-color: #d051f7;
  text-align: center;
  width: 28rem;
  height: 4.2rem;
  margin-right: 3.25rem;
  margin-top: 2rem;
  border: 1px solid black;
  border-top-right-radius: 20px;
  border-top-left-radius: 20px;
}

.recipes-section {
  grid-area: recipes;
  display: flex-end;
  align-items: center;
  justify-content: space-around;
  border-bottom: 1px solid black;
  border-left: 1px solid black;
  border-right: 1px solid black;
  border-bottom-right-radius: 10px;
  border-bottom-left-radius: 10px;
  background: aliceblue;
  width: 46rem;
  margin-left: 3.25rem;
  margin-top: 0;
}

.meal-plans-section {
  border: 1px solid black;
  border-top: none;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  grid-area: mealPlan;
  background-color: #f5f0f4;
}
.meals-section {
  border: 1px solid black;
  border-top: none;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  grid-area: meals;
  background-color: #f7e9e9;
  width: 46rem;
  margin-left: 3.25rem;
  margin-top: 0;
  margin-bottom: 2.45rem;
}

.btn {
  background-color: lightgreen;
  border: 2px solid black;
}

.current-page-selection {
  font-weight: 700;
}

.create-meal-btn {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  width: 2rem;
  height: 2rem;
  font-size: 10px;
  text-align: center;
  background-color: transparent;
  color: white;
}

.create-meal-box {
  position: relative;
  top: -2rem;
  right: -27.1rem;
}
</style>