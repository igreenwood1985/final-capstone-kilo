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
          >Recipes</router-link> ∙<router-link
          :to="{name:'my-meals'}"
          class="current-page-selection"
          >
          
           My Meals</router-link> ∙<router-link class="link-plan"
           :to="{name: 'my-meal-plans'}"> Meal Plans</router-link></span>
        
      </h1>

      <div class="meals-heading">
        <h2 class="meals-title">
          My Meals
          <div class="create-meal-box">
            <img
            src="../../plus-5-xxl.png"
            alt="Create New Meal Button"
            class="create-meal-btn"
            v-on:click="toggleForm()"
          />
          <div class="create-meal-form" v-show="createFormToggled">
            <h4 class="new-meal-form-text">Create a New Meal</h4>
            <form>
            <input type="text" id="newMealName" name="newMealName" v-model="meal.mealName" placeholder="New Meal Name" />
            <input type="text" id="newMealDesc" name="newMealDesc" v-model="meal.description" placeholder="New Meal Description" />
            <br>
            <button
              class="btn submit-new-meal-btn btn-primary"
              size="sm"
              type="reset"
              v-on:click="createMeal()"
            >
              Submit
            </button>
          </form>
          </div>
          
          </div>

          
        </h2>
      </div>

      <my-meals class="meals-section" />
    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import MyMeals from "./MyMeals.vue";

export default {
  components: {
    MyMeals
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
  color:#1f2937;
}
.link-recipe:hover{
  color: #5194f7;
}

.current-page-selection:hover{
  color: #f75151;
}

.link-plan:hover{
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
    "meals-heading meals-heading"
    "meals meals";
  width: 88%;
  margin: auto;
}

.heading {
  text-align: center;
  grid-area: header;
  border-bottom: 0.5px solid #1f2937;
  background-image: url("../../dashboard-banner.jpg");
  background-position: center;
  height: 12rem;
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

.my-recipes-link:hover {
  text-decoration: underline;
}

.meals-heading {
  grid-area: meals-heading;
  background-color: #f75151;
  text-align: center;
  width: 76rem;
  height: 3.2rem;
  margin-left: 3.25rem;
  margin-top: 2.5rem;
  border: 1px solid black;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
}

.meals-section {
  grid-area: meals;
  background-color: #f7e9e9;
  width: 76rem;
  margin-left: 3.25rem;
  border: 1px solid black;
  border-top: none;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
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
  width: 1.25rem;
  height: 1.25rem;
  font-size: 10px;
  text-align: center;
  background-color: transparent;
}

.create-meal-box {
  position: relative;
  top: -2.5rem;
  right: .10rem;
}

.create-meal-plan-box {
  position: relative;
  top: -3.95rem;
  right: -0.15rem;
}

.new-meal-form-text {
  color: black;
  margin-top: 5px;
}

.create-meal-form {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-direction: column;
  border: 1px solid black;
  border-radius: 5px;
 width: 23.5rem;
  background-color: white;
  height: 11rem;
  margin-left: 2rem;
  padding: 2px;
  opacity: .97;
}

#newMealName,
#newMealDesc {
  width: 10rem;
  height: 2rem;
  font-size: 0.75rem;
  text-align: center;
}

.submit-new-meal-btn {
  outline: 1px solid black;
  margin: 0.5rem;
}

.mealplans-title {
  margin-top: 0.7rem;
}

.create-meal-plan-form {
  position: relative;
  z-index: 1;
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-direction: column;
  border: 1px solid black;
  border-radius: 5px;
  width: 23.5rem;
  background-color: white;
  height: 11rem;
  margin-left: 2rem;
  padding: 2px;
  opacity: .97;
}
</style>