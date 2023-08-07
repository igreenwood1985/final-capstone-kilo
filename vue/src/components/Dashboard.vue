<template>
  <div><card v-for="recipe in favoriteRecipes" v-bind:recipe="recipe" v-bind:key="recipe.recipe.uri" v-bind:enable-add="true"></card></div>
</template>

<script>
import AccountService from '../services/AccountService.js';
import Card from './Card.vue';
export default {
    components: {Card},
    data() {return {favoriteRecipes: []};},
    methods:{
        getFavoriteRecipes(){
            AccountService.getFavoritedRecipes().then(response => {
                this.favoriteRecipes = response.data;
            })
        }
    }
}
</script>
<style>

</style>