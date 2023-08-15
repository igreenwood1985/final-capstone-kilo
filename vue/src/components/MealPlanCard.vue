<template>
  <div class="card-box">
    <div class="meal-plan-card">

      <div class="meal-plan-card-heading">
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
        <h2 class="meal-plan-description" v-show="mealPlanEditToggle == false">
          {{ mealPlan.description }}
        </h2>
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
    };
  },
  methods: {},
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

.meal-plan-card-heading {
  
}

</style>