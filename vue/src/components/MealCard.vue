<template>
  <div class="meal-card">
    <div class="meal-card-heading" v-if="renderComponent === true">

      <div class="top-left">
        <img src="../../delete-xxl.png" alt="Delete Icon" class="delete-btn"
        v-show="mealEditToggle == true" v-on:click="deleteMeal(); mealEditToggle = false;">
      </div>
      
      <router-link
        v-bind:to="{ name: 'meal-editor', params: { id: meal.meal_id } }"
        class="meal-name"
      >
        <h2
          v-on:click="updateCurrentMealInStore()"
          v-show="mealEditToggle == false"
          v-bind:key="meal.name"
        >
          {{ meal.name }}
        </h2>
      </router-link>
      <b-input
        size="sm"
        class="meal-name-input"
        v-bind:value="meal.name"
        v-bind:placeholder="'Meal Name'"
        v-show="mealEditToggle == true"
        v-model="enteredMealName"
        maxlength="24"
      />
      <h2 class="meal-description" v-show="mealEditToggle == false">
        {{ meal.description }}
      </h2>
      <b-input
        size="sm"
        class="meal-desc-input"
        v-bind:value="meal.description"
        v-bind:placeholder="'Meal Description'"
        v-show="mealEditToggle == true"
        v-model="enteredDescription"
        maxlength="32"
      />
      <div class="bottom-right">
        <img
          class="edit-btn"
          v-show="mealEditToggle == false"
          v-on:click="mealEditToggle = true"
          src="../../Edit_Icon.png"
          alt="Edit button"
        />
        <img
          class="save-btn"
          v-show="mealEditToggle == true"
          v-on:click="updateMealName()"
          src="../../Save_Icon.png"
          alt="Save button"
        />
      </div>
    </div>

    <div class="images-box">
      <div
        class="images-loop"
        v-for="recipe in updateRecipesArray"
        v-bind:key="recipe.id"
      >
        <div class="inner-images">
          <img v-bind:src="recipe.img" alt="Image of Recipe" />
        </div>
      </div>
    </div>
    <div class="drop-down-container">
      <div v-show="updateAddToMealPlan.length > 0" class="add-to-meal-plan-dropdown">
        <b-dropdown id="dropdown-1" text="Add" variant="light" class="m-md-2">
          <b-dropdown-item v-for="mealPlan in updateAddToMealPlan" v-bind:key="mealPlan.mealPlanId" v-on:click="addToMealPlan(mealPlan.mealPlanId)">{{mealPlan.name}}</b-dropdown-item>
        </b-dropdown>
      </div>
      <div v-show="updateRemoveFromMealPlan.length > 0" class="remove-from-meal-plan-dropdown">
        <b-dropdown id="dropdown-1" text="Remove" variant="light" class="m-md-2">
          <b-dropdown-item v-for="mealPlan in updateRemoveFromMealPlan" v-bind:key="mealPlan.mealPlanId" v-on:click="removeFromMealPlan(mealPlan.mealPlanId)">{{mealPlan.name}}</b-dropdown-item>
        </b-dropdown>
      </div>
    </div>
    
  </div>
</template>

<script>
//This was added to give functionality to the dropdown list
import AccountService from "../services/AccountService.js";

export default {
  components: {},
  name: "meal-card",
  props: {
    meal: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
  },
  computed: {
    updateAddToMealPlan() {
      let mealPlans = this.$store.state.mealPlans
      console.log("adding to meal plan...");
      mealPlans = mealPlans.filter(mealPlan => {
        for (let counter = 0; counter < mealPlan.meals.length; counter++) {
          if (this.meal.meal_id == mealPlan.meals[counter].meal_id) {
            return false;
          }
        }
        return true;
      });
      return mealPlans;
    },
    updateRemoveFromMealPlan() {
      let mealPlans = this.$store.state.mealPlans
      console.log("removing from meal plan...");
      mealPlans = mealPlans.filter(mealPlan => {
        for (let counter = 0; counter < mealPlan.meals.length; counter++) {
          if (this.meal.meal_id == mealPlan.meals[counter].meal_id) {
            return true;
          }
        }
        return false;
      });
      return mealPlans;
    },
    updateArray() {
      return this.$store.state.meals;
    },
    updateRecipesArray() {
      const slicedArray = this.meal.recipes.slice(0, 6);
      return slicedArray.reverse();
    },
    updatedMealName() {
      return this.meal.name;
    },
  },
  data() {
    return {
      selectedMealPlan: "",
      mealPlan: [],
      mealEditToggle: false,
      enteredMealName: "",
      enteredDescription: "",
      mealId: 0,
      renderComponent: true,
    };
  },
  methods: {
    setMealId() {
      this.mealId = this.meal.meal_id;
    },
    async forceRerender() {
      this.renderComponent = false;
      await this.$nextTick();
      this.renderComponent = true;
    },
    updateCurrentMealInStore() {
      this.$store.commit("SET_CURRENT_MEAL", this.meal.meal_id);
    },
    updateMealName() {
      AccountService.updateMeal(this.formatMeal()).then((response) => {
        if (response.status == 200) {
          AccountService.getDashboardMeals().then((response) => {
            if (response.status == 200) {
              this.$store.commit("SET_MEALS", response.data);
              this.enteredDescription = "";
              this.enteredMealName = "";
            }
          });
        }
      });
      this.mealEditToggle = false;
    },
    deleteMeal() {
      AccountService.deleteMeal(this.meal.meal_id).then((response) => {
        if (response.status != 200) {
          this.$store.commit("REMOVE_MEAL", this.meal);
          location.reload();
        }
      })
    },
    checkForEmptyName() {
      if (this.enteredMealName == "") {
        return "Meal #" + this.meal.meal_id;
      } else {
        return this.enteredMealName;
      }
    },
    checkForEmptyDesc() {
      if (this.enteredDescription == "") {
        return "Empty Meal Description";
      } else {
        return this.enteredDescription;
      }
    },
    formatMeal() {
      const formattedMeal = {
        meal_id: this.meal.meal_id,
        name: this.checkForEmptyName(),
        description: this.checkForEmptyDesc(),
      };
      return formattedMeal;
    },
    addToMealPlan(mealPlanId) {
      AccountService.addMealToMealPlan(this.meal, mealPlanId).then((response) => {
        if (response.status == 201) {
          AccountService.getAllMealPlans().then((mealPlanResponse) => {
            this.$store.commit("SET_MEAL_PLANS", mealPlanResponse.data);
          });
        }
      });
    },
    removeFromMealPlan(mealPlanId) {
      AccountService.removeMealFromMealPlan(mealPlanId, this.meal.meal_id).then((response) => {
        if (response.status == 204) {
          AccountService.getAllMealPlans().then((mealPlanResponse) => {
            this.$store.commit("SET_MEAL_PLANS", mealPlanResponse.data);
          });
        }
      });
    }
    //This was added to give functionality to the dropdown list
  },
  created() {

  }
};
</script>

<style scoped>
.meal-card {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 200px;
  height: 15.5rem;
  margin: 20px;
  background-color: #F8F9FA;
  overflow: hidden;
}

.meal-card:hover {
  border: 3px solid #f58585;
}

.meal-card-heading {
  border-bottom: solid 3px black;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  background-color: white;
  margin-top: 0.25rem;
}

.meal-name {
  text-align: center;
  color: black;
}

.meal-name-input {
  text-align: center;
  width: 60%;
  margin-top: -5px;
  margin-left: auto;
  margin-right: auto;
  font-size: 0.85rem;
}

.meal-desc-input {
  text-align: center;
  width: 70%;
  margin-left: auto;
  margin-right: auto;
  margin-top: -5px;
  font-size: 0.6rem;
}

.meal-name > h2 {
  font-size: 1rem;
}

.meal-description {
  font-size: 0.7rem;
  text-align: center;
  margin-bottom: 0.25rem;
}

img {
  display: inline-block;
  max-height: 3rem;
  max-width: 2.25rem;
  border-radius: 5px;
}

.images-box {
  display: flex;
  justify-content: center;
  align-items: center;
  align-content: center;
  flex-direction: column;
  margin-top: 0.5rem;
  flex-wrap: wrap;
  margin-top: -1.5px;
  height: 8.75rem;
  background-image: url("https://images.unsplash.com/photo-1495195134817-aeb325a55b65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0dGluZyUyMGJvYXJkfGVufDB8fDB8fHww&w=1000&q=80");
  background-size: cover;
}

.inner-images {
  display: inline-block;
  margin: 3px;
  border: 1px solid #cfe1ed;
  border-radius: 5px;
}

.edit-btn, .delete-btn {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  width: 1rem;
  height: 1rem;
  font-size: 10px;
  text-align: center;
  border-radius: 20%;
  background-color: transparent;
  color: #0a3d5d;
}

.save-btn {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  width: 1.2rem;
  height: 1.2rem;
  font-size: 10px;
  text-align: center;
  border-radius: 20%;
  background-color: transparent;
  color: #0a3d5d;
}

.delete-btn:hover{
  width: 1.2rem;
  height: 1.2rem;
}

.edit-btn:hover{
  width: 1.2rem;
  height:1.2rem;
}

.save-btn:hover {
  width: 1.4rem;
  height: 1.4rem;
}


.bottom-right {
  position: relative;
  top: 7.15rem;
  right: -10.35rem;
}

.top-left {
  position: relative;
  top: .4rem;
  right: -.5rem;  
}

.drop-down-container {
  align-content: center;
}

.add-to-meal-plan-dropdown {
  margin-right: 1.5rem;
  position: absolute;
}

.remove-from-meal-plan-dropdown {
  margin-left: 4.5rem;
  position: absolute;
}


</style>