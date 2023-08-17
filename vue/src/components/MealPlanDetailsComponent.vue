<template>
  <div class="page">
    <div class="meal-details">
      <div class="meal-heading">
        <h1 class="meal-name" v-show="mealEditToggle == false">
          {{ mealPlan.name }}
        </h1>
        <h3 class="meal-desc" v-show="mealEditToggle == false">
          {{ mealPlan.description }}
        </h3>
        <div class="top-right">
          <b-button variant="danger" v-on:click="deleteMealPlan()"
            >Delete Meal Plan</b-button
          >
        </div>

        <div class="inputs">
          <b-input
            size="sm"
            class="meal-name-input"
            v-bind:value="mealPlan.name"
            v-bind:placeholder="'Meal Plan Name'"
            v-show="mealEditToggle == true"
            v-model="enteredMealPlanName"
            maxlength="24"
          />
          <b-input
            size="sm"
            class="meal-desc-input"
            v-bind:value="mealPlan.description"
            v-bind:placeholder="'Meal Plan Description'"
            v-show="mealEditToggle == true"
            v-model="enteredDescription"
            maxlength="32"
          />
        </div>

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
            v-on:click="
              updateMealPlanName();
              mealEditToggle = false;
            "
            src="../../Save_Icon.png"
            alt="Save button"
          />
        </div>
      </div>
      <br />
      <p>This Meal Plan includes the following Meals:</p>
      <meal-card
        v-for="meal in mealPlan.meals"
        v-bind:meal="meal"
        v-bind:key="meal.MealPlanid"
        v-bind:enable-add="true"
      />
    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";

import MealCard from "./MealCard.vue";

export default {
  name: "meal-plan-details-component",
  data() {
    return {
      mealPlan: {},
      mealEditToggle: false,
      enteredMealPlanName: "",
      enteredDescription: ""
    };
  },
  components: {
    MealCard,
  },
  methods: {
    retrieveMealPlanByID() {
      AccountService.getMealPlanByID(this.$route.params.id).then((response) => {
        this.mealPlan = response.data;
      });
    },
    deleteMealPlan() {
      AccountService.deleteMealPlan(this.$route.params.id).then((response) => {
        if (response.status !== 200) {
          this.$router.push("/dashboard");
          this.$store.commit("REMOVE_MEAL_PLAN", this.mealPlan);
        }
      });
    },
    
    updateMealPlanName() {
      AccountService.updateMealPlan(this.formatMealPlan()).then((response) => {
        if (response.status == 200) {
          AccountService.getFavoritedMeals().then((response) => {
            if (response.status == 200) {
              this.$store.commit("SET_MEALS", response.data);
              this.enteredDescription = "";
              this.enteredMealPlanName = "";
            }
          });
        }
        location.reload();
      });
      this.mealEditToggle = false;
    },
    checkForEmptyName() {
      if (this.enteredMealPlanName == "") {
        return "Meal Plan #" + this.mealPlan.mealPlanId;
      } else {
        return this.enteredMealPlanName;
      }
    },
    checkForEmptyDesc() {
      if (this.enteredDescription == "") {
        return "Empty Meal Plan Description";
      } else {
        return this.enteredDescription;
      }
    },
    formatMealPlan() {
      const formattedMealPlan = {
        mealPlanId: this.mealPlan.mealPlanId,
        name: this.checkForEmptyName(),
        description: this.checkForEmptyDesc(),
      };
      return formattedMealPlan;
    },
  },
  created() {
    this.retrieveMealPlanByID();
  },
};
</script>

<style scoped>
.meal-details {
  margin: auto;
  width: 50%;
  min-height: 86.4vh;
  border: 2px solid #1f2937;
  text-align: center;
  background-color: white;
  opacity: 0.95;
}

.meal-name {
  margin-top: 0.5rem;
}

.meal-desc {
  margin-bottom: 0rem;
}

.meal-heading {
  background-color: #f5f0f4;
  padding: 10px;
  padding-bottom: 30px;
  border-bottom: 2px solid #1f2937;
}

.meal-name-input {
  width: 60%;
  height: 1.5rem;
  margin-top: .5rem;
  font-size: 1.5rem;
}

.meal-desc-input {
    width: 80%;
    height: 1.5rem;
    margin-top: .25rem;
    font-size: 1.25rem;
}

.page {
  background-image: url("../../dashboard-banner.jpg");
  background-position: bottom;
  background-size: 190rem;
}

.top-right {
  position: absolute;
  bottom: 37.35rem;
  right: 24.25rem;
}

.edit-btn {
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

.edit-btn:hover {
  width: 1.2rem;
  height: 1.2rem;
}

.save-btn:hover {
  width: 1.4rem;
  height: 1.4rem;
}

.bottom-right {
  position: relative;
  bottom: -0.5rem;
  left: 23rem;
}

.inputs {
    margin: auto;
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
}
</style>