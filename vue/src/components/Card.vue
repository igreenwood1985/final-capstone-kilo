<template>
  <!-- <router-link v-bind:to="{ name: 'recipe', params: { uri: recipe.recipe.uri } }"> -->
    <div class="card">
      <h2 class="recipe-name">{{ recipe.recipe.label }}</h2>
      <img v-if="recipe.recipe.uri" v-bind:src="recipe.recipe.image" />
      <h3 class="time-to-make">{{ recipe.recipe.totalTime }}</h3>
      <p class="calories">{{ recipe.recipe.calories }}</p>
      <p class="cuisine-type">{{ recipe.recipe.cuisineType }}</p>
      <p class="tags">{{combineHealthAndDietaryTags()}}</p>
    </div>

</template>

<script>
export default {
  name: "card",
  props: {
    recipe: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      healthTags: "",
    };
  },
  methods: {
    combineHealthAndDietaryTags() {
       return this.recipe.recipe.healthLabels.concat(this.recipe.recipe.dietLabels)

    },
  },
};
</script>

<style>
</style>