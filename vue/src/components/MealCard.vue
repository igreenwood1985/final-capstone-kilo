<template>
  <div class="main">
    <router-link v-bind:to="{ name: 'meal-editor', params: {id: meal.meal_id} }">
      <h2 class="meal-name" v-on:click="updateCurrentMealInStore()">{{ meal.name }}</h2>
    </router-link>
    <h2 class="meal-description">{{ meal.description }}</h2>
  </div>
</template>

<script>


export default {
    name: "meal-card",
      props: {
    meal: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
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

<style>
.main {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 275px;
  height: 400px;
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