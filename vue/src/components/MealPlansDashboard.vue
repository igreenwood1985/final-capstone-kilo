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
          ><router-link class="overview"
            :to="{ name: 'dashboard' }"
            >Overview</router-link
          >
          ∙
          <router-link class="link-recipe"
          :to="{name:'my-recipes'}" 
          >Recipes</router-link> ∙<router-link class="link-meal"
          :to="{name:'my-meals'}">
          
           My Meals</router-link> ∙<router-link
           :to="{name: 'my-meal-plans'}"
           class="current-page-selection"
           > Meal Plans</router-link></span>
        
      </h1>

      <div class="meal-plans-container">

      <div class="mealplans-heading">
        <h2 class="mealplans-title">My Meal Plans</h2>
      </div>

      <div class="mealplans-here">
        <overview-meal-plans class="meal-plans-section" />
      </div>

      </div>

      

    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import OverviewMealPlans from "./OverviewMealPlans.vue";

export default {
  components: {
      OverviewMealPlans
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

<style scoped>
.overview:hover{
  color:chartreuse;
}
.link-recipe:hover{
  color: #5194f7;
}
.link-meal:hover{
  color: #f75151;
}
.current-page-selection:hover{
  color: #d051f7;
}

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
    "mealPlans-heading mealPlans-heading"
    "mealPlan mealPlan";
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

.meal-plans-section {
  border: 1px solid black;
  border-top: none;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  grid-area: mealPlan;
  background-color: #f5f0f4;
}

.btn {
  background-color: lightgreen;
  border: 2px solid black;
}

.current-page-selection {
  font-weight: 700;
}

</style>