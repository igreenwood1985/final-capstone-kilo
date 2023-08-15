<template>
  <div>
    <div class="meal-plan-card">
      <div class="meal-plan-card-heading">
        <router-link
          v-bind:to="{
            name: 'meal-plan-details',
            params: { id: mealPlan.meal_plan_id }
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
          v-show="mealPlanEditToggle == true"
        />
        <h2 class="meal-plan-description" v-show="mealPlanEditToggle == false">
          {{ mealPlan.description }}
        </h2>
        <b-input
          size="sm"
          class="meal-plan-desc-input"
          v-bind:value="mealPlan.description"
          v-show="mealPlanEditToggle == true"
        />
      </div>
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
</style>