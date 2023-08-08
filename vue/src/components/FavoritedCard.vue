<template>
  <div class="card">
    <router-link v-bind:to="{name: 'recipe-details', params: {id : recipe.uri}}">
      <h2 class="recipe-name">{{ recipe.label }}</h2>
    </router-link>
    <button v-on:click="removeFromFavorites">Unfavorite</button>
    <p>Ingredient: {{ recipe.ingredients }}</p>
    <p>Instructions: {{ recipe.instructions }}</p>
  </div>
</template>

<script>
//import AccountService from "../services/AccountService.js";

export default {
  name: "favorited-card",
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
    // removeFromFavorites() {
    //   AccountService.removeFromFavorites(this.recipe).then((response) => {
    //     if (response.status == 201) {
    //       return Object.assign({}, this.recipe, { favorited: true });
    //     }
    //   });
    // },
  },
};
</script>

<style>
.card {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 275px;
  height: 600px;
  margin: 20px;
}

.card.read {
  background-color: lightgray;
}

.card img {
  max-width: 75%;
  height: auto;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.card .recipe-name {
  font-size: 1.2rem;
  text-align: center;
}

.card .time-to-make {
  font-size: 1rem;
}
</style>