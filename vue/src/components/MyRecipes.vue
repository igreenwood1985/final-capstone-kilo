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
  name: "my-recipes-component",
  components: {
    FavoritedCard,
  },
  data() {
    return {
      favoriteRecipes: [],
      componentKey: 0,
    };
  },
  methods: {
    getAllFavoriteRecipes() {
      AccountService.getFavoritedRecipes().then((response) => {
        this.favoriteRecipes = response.data;
      });
    },
    forceRefresh() {
      this.componentKey += 1;
    },
  },
  created() {
    this.getAllFavoriteRecipes();
  },
};
</script>

<style>
.heading {
  display: block;
}
</style>