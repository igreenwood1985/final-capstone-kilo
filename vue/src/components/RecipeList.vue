<template>
  <div>
      <favorited-card
        v-for="recipe in this.favoriteRecipes"
        v-bind:recipe="recipe"
        v-bind:key="recipe.id"
        v-bind:enable-add="true"
      />
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import FavoritedCard from "./FavoritedCard.vue";

export default {
  name: "recipe-list",
  components: {
    FavoritedCard,
  },
  data() {
    return {
      favoriteRecipes: []
    }
  },
  methods: {
    getFavoriteRecipes() {
      AccountService.getFavoritedRecipes().then((response) => {
        this.favoriteRecipes = response.data;
      });
    },
  },
  created() {
    this.getFavoriteRecipes();
  }
};
</script>

<style>
</style>