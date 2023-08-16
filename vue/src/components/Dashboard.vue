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
          ∙
          <router-link :to="{ name: 'my-recipes' }">Recipes</router-link>
          ∙<router-link :to="{ name: 'my-meals' }"> My Meals</router-link>
          ∙<router-link :to="{ name: 'my-meal-plans' }">
            Meal Plans</router-link
          ></span
        >
      </h1>

      <div class="recipes-heading">
        <h2 class="recipes-title">My Latest Recipes</h2>
      </div>

      <div class="recipes-here">
        <overview-recipes class="recipes-section" />
      </div>

      <div class="mealplans-heading">
        <h2 class="mealplans-title">My Meal Plans</h2>
        <div class="create-meal-plan-box">
          <img
            src="../../plus-5-xxl.png"
            alt="Create New Meal Plan Button"
            class="create-meal-btn"
            v-on:click="toggleFormMealPlan()"
          />
          <div class="create-meal-plan-form" v-show="createFormToggledMealPlan">
            <h4 class="new-meal-form-text">Create a New Meal Plan</h4>
            <form>
              <input
                type="text"
                id="newMealName"
                name="newMealName"
                v-model="mealPlan.mealPlanName"
                placeholder="New Meal Plan Name"
                maxlength="24"
              />
              <input
                type="text"
                id="newMealDesc"
                name="newMealDesc"
                v-model="mealPlan.mealPlanDescription"
                placeholder="New Meal Plan Description"
                maxlength="32"
              />
              <br />
              <button
                class="btn submit-new-meal-btn btn-primary"
                size="sm"
                type="reset"
                v-on:click="createMealPlan()"
              >
                Submit
              </button>
            </form>
          </div>
        </div>
      </div>

      <div class="mealplans-here">
        <overview-meal-plans class="meal-plans-section" />
      </div>

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
                <input
                  type="text"
                  id="newMealName"
                  name="newMealName"
                  v-model="meal.mealName"
                  placeholder="New Meal Name"
                  maxlength="24"
                />
                <input
                  type="text"
                  id="newMealDesc"
                  name="newMealDesc"
                  v-model="meal.description"
                  placeholder="New Meal Description"
                  maxlength="32"
                />
                <br />
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

      <overview-meals class="meals-section" />
    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import OverviewMealPlans from "./OverviewMealPlans.vue";
import OverviewMeals from "./OverviewMeals.vue";
import OverviewRecipes from "./OverviewRecipes.vue";

export default {
  components: { OverviewRecipes, OverviewMealPlans, OverviewMeals },
  data() {
    return {
      createFormToggled: false,
      createFormToggledMealPlan: false,
      meal: {
        mealName: "",
        description: "",
      },
      mealPlan: {
        mealPlanName: "",
        mealPlanDescription: "",
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
      location.reload();
    },
    createMealPlan() {
      AccountService.createMealPlan(this.formatMealPlan()).then((response) => {
        return response.status == 200;
      });
      this.toggleFormMealPlan();
      this.mealPlan.mealPlanName = "";
      this.mealPlan.mealPlanDescription = "";
      location.reload();
    },
    checkForEmptyName() {
      if (this.meal.mealName == "") {
        return "New Meal";
      } else {
        return this.meal.mealName;
      }
    },
    checkForEmptyNameMealPlan() {
      if (this.mealPlan.mealPlanName == "") {
        return "New Meal Plan";
      } else {
        return this.mealPlan.mealPlanName;
      }
    },
    checkForEmptyDescMealPlan() {
      if (this.mealPlan.mealPlanDescription == "") {
        return "Empty Meal Plan Description";
      } else {
        return this.mealPlan.mealPlanDescription;
      }
    },
    checkForEmptyDesc() {
      if (this.meal.description == "") {
        return "Empty Meal Description";
      } else {
        return this.meal.description;
      }
    },
    formatMeal() {
      const formattedMeal = {
        meal_id: 0,
        name: this.checkForEmptyName(),
        description: this.checkForEmptyDesc(),
        user_id: 0,
      };
      return formattedMeal;
    },
    formatMealPlan() {
      const formattedMealPlan = {
        mealPlanId: 0,
        name: this.checkForEmptyNameMealPlan(),
        description: this.checkForEmptyDescMealPlan(),
        userId: 0
      };
      return formattedMealPlan;
    },
    toggleForm() {
      this.createFormToggled = this.createFormToggled == false ? true : false;
    },
    toggleFormMealPlan() {
      this.createFormToggledMealPlan =
        this.createFormToggledMealPlan == false ? true : false;
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

.recipes-heading {
  grid-area: recipes-heading;
  background-color: #5194f7;
  text-align: center;
  width: 46rem;
  height: 3.2rem;
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
  height: 3.2rem;
  margin-left: 3.25rem;
  margin-top: 2.5rem;
  border: 1px solid black;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
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
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
}

.recipes-section {
  grid-area: recipes;
  display: flex;
  justify-content: space-around;
  border-bottom: 1px solid black;
  border-left: 1px solid black;
  border-right: 1px solid black;
  border-bottom-right-radius: 10px;
  border-bottom-left-radius: 10px;
  background: aliceblue;
  width: 46rem;
  margin-left: 3.25rem;
  margin-top: -1rem;
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
  display: flex;
  justify-content: space-around;
  border-top: none;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
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
  width: 1.25rem;
  height: 1.25rem;
  font-size: 10px;
  text-align: center;
  background-color: transparent;
  color: white;
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