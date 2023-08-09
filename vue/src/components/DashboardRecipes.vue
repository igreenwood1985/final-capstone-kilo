<template>
  <div>
    <favorited-card
      v-for="recipe in this.$store.state.favoriteRecipes"
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
  name: "dashboard-recipes",
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
    getFavoriteRecipes() {
      AccountService.getFavoritedRecipes().then((response) => {
        this.$store.state.favoriteRecipes = response.data;
      });
    },
    forceRefresh() {
      this.componentKey += 1;
    },
  },
  created() {
    this.getFavoriteRecipes();
  },
};
</script>

<style>
.heading {
  display: block;
}
</style>