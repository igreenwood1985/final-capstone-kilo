<template>
  <div class="main">
    <!-- <router-link v-bind:to="{ name: 'meal-editor', params: {id: meal.meal_id} }">
      <h2 class="meal-name" v-on:click="updateCurrentMealInStore()">{{ meal.name }}</h2>
    </router-link>
    <h2 class="meal-description">{{ meal.description }}</h2> -->
    <mini-fav-card
      v-for="recipe in updateArray"
      v-bind:recipe="recipe"
      v-bind:key="recipe.id"
      v-bind:enable-add="true"
      class="favorited-card"
      v-show="updateArray.length !== 0"
    />
  </div>
</template>

<script>
import MiniFavCard from './MiniFavCard.vue';


export default {
  components: { MiniFavCard },
    name: "meal-card",
      props: {
    meal: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
  },
  computed: {
    updateArray() {
     return this.$store.state.favoritedRecipes.slice(0, 3);
    }
  },
  data() {
    return {
  
    };
  },
  methods: {
    updateCurrentMealInStore() {
      this.$store.commit("SET_CURRENT_MEAL", this.meal.meal_id);

    }



  },



  }


</script>

<style scoped>
.main {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  max-width: 12rem;
  max-height: 12rem;
  margin: 20px;
  background-color: white;
  overflow: hidden;
}




.main .recipe-name {

  font-size: 1.2rem;
  text-align: center;
}

.main .time-to-make {
  font-size: 1rem;
}

#image {
   width: 100%; 
   height: 50%;
}
</style>