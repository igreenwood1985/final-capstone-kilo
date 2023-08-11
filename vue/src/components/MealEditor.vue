<template>
  <div>
      <h1>{{ meal.name }}
          <b-button variant="danger" v-on:click="deleteMeal($store.state.currentMeal)">Delete</b-button>
      </h1>
      <favorited-card
      v-for="recipe in meal.recipes"
      v-bind:recipe="recipe"
      v-bind:key="recipe.id"
      v-bind:enable-add="true"
    />

  </div>
</template>

<script>
import AccountService from '../services/AccountService';
import FavoritedCard from './FavoritedCard.vue';

export default {
    name: "meal-editor-component",
    data() {
        return {
            meal: {}
        }
    },
    components: {
        FavoritedCard
    },
    methods: {
        retrieveMealByID() {
            AccountService.getMealById(this.$route.params.id).then(response => {
                this.meal = response.data;
            });
        },
        deleteMeal(mealId) {
            AccountService.deleteMeal(mealId).then(response => {
                if (response.status !== 200) {
                    this.$router.push("/dashboard");
                }
            })
        }
    },
    created() {
        this.retrieveMealByID();
    }

}
</script>

<style>

</style>