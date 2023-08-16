<template>
  <div class="page">
    <div class="meal-details">
      <div class="meal-heading">
        <h1 class="meal-name" v-show="mealEditToggle == false">
          {{ meal.name }}
        </h1>
        <h3 class="meal-desc" v-show="mealEditToggle == false">
          {{ meal.description }}
        </h3>
        <div class="top-right">
          <b-button variant="danger" v-on:click="deleteMeal()"
            >Delete Meal</b-button
          >
        </div>

        <div class="inputs">
          <b-input
            size="sm"
            class="meal-name-input"
            v-bind:value="meal.name"
            v-bind:placeholder="'Meal Name'"
            v-show="mealEditToggle == true"
            v-model="enteredMealName"
            maxlength="24"
          />
          <b-input
            size="sm"
            class="meal-desc-input"
            v-bind:value="meal.description"
            v-bind:placeholder="'Meal Description'"
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
            src="https://cdn-icons-png.flaticon.com/512/84/84380.png"
            alt="Edit button"
          />
          <img
            class="edit-btn"
            v-show="mealEditToggle == true"
            v-on:click="
              updateMealName();
              mealEditToggle = false;
            "
            src="https://e7.pngegg.com/pngimages/154/420/png-clipart-computer-icons-button-save-angle-symbol.png"
            alt="Save button"
          />
        </div>
      </div>
      <br />
      <p>This meal includes the following recipes:</p>
      <favorited-card
        v-for="recipe in meal.recipes"
        v-bind:recipe="recipe"
        v-bind:key="recipe.id"
        v-bind:enable-add="true"
      />
    </div>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import FavoritedCard from "./FavoritedCard.vue";

export default {
  name: "meal-editor-component",
  data() {
    return {
      meal: {},
      mealEditToggle: false,
      enteredMealName: "",
      enteredDescription: "",
    };
  },
  components: {
    FavoritedCard,
  },
  methods: {
    getAllMeals() {
      AccountService.getFavoritedMeals().then(response => {
        if (response.status == 200) {
          this.$store.commit('SET_MEALS', response.data);
        }
      });
    },
    retrieveMealByID() {
      AccountService.getMealById(this.$route.params.id).then((response) => {
        this.meal = response.data;
      });
    },
    deleteMeal() {
      AccountService.deleteMeal(this.$route.params.id).then((response) => {
        if (response.status !== 200) {
          this.$router.push("/dashboard");
          this.$store.commit("REMOVE_MEAL", this.meal);
        }
      });
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
        location.reload();
      });
      this.mealEditToggle = false;
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
  },
  created() {
    this.retrieveMealByID();
    this.getAllMeals();
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
  background-position: right;
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