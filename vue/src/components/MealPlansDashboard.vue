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
        <h2 class="meal-plans-title">My Meal Plans</h2>
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
              />
              <input
                type="text"
                id="newMealDesc"
                name="newMealDesc"
                v-model="mealPlan.mealPlanDescription"
                placeholder="New Meal Plan Description"
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
        <my-meal-plans class="meal-plans-section" />
      </div>

      </div>

      

    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import MyMealPlans from "./MyMealPlans.vue";

export default {
  components: {
      MyMealPlans
      },
  data() {
    return {
      createFormToggledMealPlan: false,
      mealPlan: {
        mealPlanName: "",
        mealPlanDescription: "",
      }
    };
  },
  methods: {
    createMealPlan() {
      AccountService.createMealPlan(this.formatMealPlan()).then((response) => {
        return response.status == 200;
      });
      this.toggleFormMealPlan();
      this.mealPlan.mealPlanName = "";
      this.mealPlan.mealPlanDescription = "";
      location.reload();
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
    formatMealPlan() {
      const formattedMealPlan = {
        mealPlanId: 0,
        name: this.checkForEmptyNameMealPlan(),
        description: this.checkForEmptyDescMealPlan(),
        userId: 0
      };
      return formattedMealPlan;
    },
    toggleFormMealPlan() {
      this.createFormToggledMealPlan =
        this.createFormToggledMealPlan == false ? true : false;
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
.meal-plans-title,
.meals-title {
  color: white;
  padding: 0.25rem;
}

.recipes-heading a,
.meals-heading a {
  text-decoration: none;
}

.my-recipes-link,
.my-meals-link,
.my-meal-plans-link {
  color: white;
  font-size: 1rem;
}

.mealplans-heading {
  grid-area: mealPlans-heading;
  background-color: #d051f7;
  text-align: center;
  width: 76rem;
  height: 3.2rem;
  margin-left: 3.25rem;
  margin-top: 2rem;
  border: 1px solid black;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
}

.meal-plans-section {
  grid-area: mealPlan;
  background-color: #f5f0f4;
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

.create-meal-plan-box {
  position: relative;
  top: -3.95rem;
  right: -0.15rem;
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
  margin-top: 10px;
}

.new-meal-form-text {
  color: black;
  margin-top: 5px;
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

</style>