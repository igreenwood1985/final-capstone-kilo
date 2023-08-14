<template>
  <div class="meal-card">
    <div class="meal-card-heading">
      <router-link
        v-bind:to="{ name: 'meal-editor', params: { id: meal.meal_id } }"
      >
        <h2 class="meal-name" v-on:click="updateCurrentMealInStore()">
          {{ meal.name }}
        </h2>
      </router-link>
      <h2 class="meal-description">{{ meal.description }}</h2>
    </div>
    
    <div class="images-box">
<div class="images-loop" v-for="recipe in meal.recipes" v-bind:key="recipe.id">
      <div class="inner-images">
        <img v-bind:src="recipe.img" alt="Image of Recipe" />
      </div>
      
    </div>
    </div>
    

  </div>
</template>

<script>
export default {
  components: {},
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
      return this.$store.state.meals.slice(0, 3);
    },
  },
  data() {
    return {};
  },
  methods: {
    updateCurrentMealInStore() {
      this.$store.commit("SET_CURRENT_MEAL", this.meal.meal_id);
    },
  },
};
</script>

<style scoped>
.meal-card {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 12rem;
  height: 12rem;
  margin: 20px;
  background-color: white;
  overflow: hidden;
}

.meal-card-heading {
  border: solid 2px black;
  background-color: #f8f9fa;
  padding: 2px;
}

.meal-name {
  font-size: 1rem;
  text-align: center;
}

.meal-description {
  font-size: 0.75rem;
  text-align: center;
}

img {
  display: inline-block;
  max-height: 3rem;
  max-width: 2rem;
  border-radius: 2px;
}

.images-box {
  display: flex;
  justify-content: center;
  margin-top: .5rem;
  flex-wrap: wrap;
}


.inner-images {
  display: inline-block;
  border: 4px solid blue;
  margin: 3px;

}
</style>