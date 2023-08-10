<template>
  <div>

  </div>
</template>

<script>
import AccountService from '../services/AccountService'

export default {
    name: "meal-card",
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
      favorited: false,
    };
  },
  methods: {


        addToMealPlan() {
      AccountService.addMealToPlan(this.formatMeal()).then((response) => {
        return response.status == 200 //change to 201 when server status codes updated
      });
      this.favorited = true;
    },
    formatMeal() {
      const formattedMeal = {
       //To do based on database columns 
      };
      console.log(formattedMeal);
      return formattedMeal;
    }
  },



  }


</script>

<style>

</style>