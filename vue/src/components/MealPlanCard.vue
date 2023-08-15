<template>
  <div class="card-box">
    <div class="meal-plan-card">

      <div class="meal-plan-card-heading">
        <div class="top-left">
          <img src="../../delete-xxl.png" alt="Delete Icon" class="delete-btn"
          v-show="mealPlanEditToggle == true" v-on:click="deleteMealPlan(); mealPlanEditToggle = false;">
        </div>
        <router-link
          v-bind:to="{
            name: 'meal-plan-details',
            params: { id: mealPlan.mealPlanId },
          }"
          class="meal-plan-name"
        >
          <h2 v-show="mealPlanEditToggle == false">
            {{ mealPlan.name }}
          </h2>
        </router-link>

        <b-input
        size="sm"
        class="meal-plan-name-input"
        v-bind:value="mealPlan.name"
        v-bind:placeholder="'Meal Plan Name'"
        v-show="mealPlanEditToggle == true"
        v-model="enteredMealPlanName"
        />

        <h2 class="meal-plan-description" v-show="mealPlanEditToggle == false">
          {{ mealPlan.description }}
        </h2>

        <b-input
        size="sm"
        class="meal-plan-desc-input"
        v-bind:value="mealPlan.description"
        v-bind:placeholder="'Meal Plan Description'"
        v-show="mealPlanEditToggle == true"
        v-model="enteredDescription"
        />
        <div class="bottom-right">
          <img
            class="edit-btn"
            v-show="mealPlanEditToggle == false"
            v-on:click="mealPlanEditToggle = true"
            src="../../Edit_Icon.png"
            alt="Edit button"
          />
          <img
            class="edit-btn"
            v-show="mealPlanEditToggle == true"
            v-on:click="updateMealPlanName()"
            src="../../Download_Icon.png"
            alt="Save button"
          />
        </div>
        </div>

        <!-- <b-input
          size="sm"
          class="meal-plan-name-input"
          v-bind:value="mealPlan.name"
          v-show="mealPlanEditToggle == true"
        />
       
        <b-input
          size="sm"
          class="meal-plan-desc-input"
          v-bind:value="mealPlan.description"
          v-show="mealPlanEditToggle == true"
        /> -->
    </div>
  </div>
</template>

<script>
import AccountService from '../services/AccountService.js';

export default {
  name: "meal-plan-card",
  props: {
    mealPlan: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      mealPlanEditToggle: false,
      enteredMealPlanName: '',
      enteredDescription: '',
      mealPlanId: 0,
      renderComponent: true
    };
  },
  methods: {
    setMealPlan() {
      this.mealPlanId = this.mealPlan.mealPlanId;
    },
    async forceRerender() {
      this.renderComponent = false;
      await this.$nextTick();
      this.renderComponent = true;
    },
    updateMealPlanName() {
      AccountService.updateMealPlan(this.formatMealPlan()).then((response) => {
        if (response.status == 200) {
          AccountService.getAllMealPlans().then((response) => {
            if (response.status == 200) {
              this.$store.commit("SET_MEAL_PLANS", response.data);
              this.enteredDescription = "";
              this.enteredMealPlanName = "";
            }
          });
        }
      });
      this.mealPlanEditToggle = false;
    },
    deleteMealPlan() {
      AccountService.deleteMealPlan(this.mealPlan.mealPlanId).then((response) => {
        if (response.status != 200) {
          this.$store.commit("REMOVE_MEAL_PLAN", this.mealPlan);
          location.reload();
        }
      })
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
    }
  },
};
</script>

<style scoped>
.meal-plan-card {
  border: 2px solid black;
  background-color: white;
  border-radius: 10px;
  width: 22rem;
  height: 12rem;
  margin-top: 5px;
  text-align: center;
}

.meal-plan-name-input {
  text-align: center;
  width: 60%;
  margin-top: -5px;
  margin-left: auto;
  margin-right: auto;
  font-size: 0.85rem;
}

.meal-plan-desc-input {
  text-align: center;
  width: 70%;
  margin-left: auto;
  margin-right: auto;
  margin-top: -5px;
  font-size: 0.6rem;
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