<template>
  <div class="meal-card">
    <div class="meal-card-heading" v-if="renderComponent === true">

      <div class="top-left">
        <img src="../../delete-xxl.png" alt="Delete Icon" class="delete-btn"
        v-show="mealEditToggle == true" v-on:click="deleteMeal()">
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
      />
      <div class="bottom-right">
        <img
          class="edit-btn"
          v-show="mealEditToggle == false"
          v-on:click="mealEditToggle = true"
          src="https://cdn-icons-png.flaticon.com/512/84/84380.png"
          alt="Edit button"
        />
        <img
          class="edit-btn"
          v-show="mealEditToggle == true"
          v-on:click="updateMealName()"
          src="https://e7.pngegg.com/pngimages/154/420/png-clipart-computer-icons-button-save-angle-symbol.png"
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

    <!-- <div class="add-to-mealplan-dropdown">
      <b-dropdown
        id="dropdown-1"
        text="Add To Meal Plan"
        variant="light"
        class="m-md-2"
      >
        <b-dropdown-item
          v-for="mealPlan in updateMealPlans"
          v-bind:key="mealPlan.mealPlan_id"
          v-on:click="addToMealPlan(mealPlan.mealPlan_id)"
          >{{ mealPlan.mealPlan_name }}</b-dropdown-item
        >
      </b-dropdown>
    </div> -->
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
    updateArray() {
      return this.$store.state.meals.slice(0, 3);
    },
    updateRecipesArray() {
      const slicedArray = this.meal.recipes.slice(this.meal.recipes.length - 6);
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
          AccountService.getFavoritedMeals().then((response) => {
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
        }
      })
    },
    checkForEmptyName() {
      if (this.enteredMealName == "") {
        return "New Meal #" + this.meal.meal_id;
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
    //     addToMealPlan(mealPlanId) {
    //   AccountService.addMealToMealPlan(this.meal, mealPlanId).then((response) => {
    //     if (response.status == 201) {
    //       AccountService.getFavoritedMeals().then((mealResponse) => {
    //         this.$store.commit("SET_MEALS", mealResponse.data);
    //       });
    //     }
    //   });
    // },

    created() {
      this.setMealId();
    },

    //This was added to give functionality to the dropdown list
  },
};
</script>

<style scoped>
.meal-card {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 200px;
  height: 16rem;
  margin: 20px;
  background-color: white;
  overflow: hidden;
}

.meal-card-heading {
  border-bottom: solid 3px black;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  background-color: #fdfdfe;
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
</style>