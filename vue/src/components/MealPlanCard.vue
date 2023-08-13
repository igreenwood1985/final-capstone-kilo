<template>
  
    <div>
        <h3></h3>
        <div class="centered">{{mealPlan.name}}</div>
        
        <div class="top-right"><span class="minus" v-on:click="removeFromFavorites()" title="Remove from Favorites">x</span></div>
    </div>

</template>

<script>
export default {
    name: 'meal-plan-card',
    props: {
    mealPlan: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
  },
    data() {
        return {
            
        }
    },
    methods: {
        
    }

}
</script>

<style scoped>

</style>