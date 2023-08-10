<template>
  <div>
    <h2 class="meal-name">{{ meal.mealName }}</h2>
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



  },



  }


</script>

<style>

</style>