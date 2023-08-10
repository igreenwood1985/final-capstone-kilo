<template>
  <div>
      <h1>{{ meal.name }}</h1>
  </div>
</template>

<script>
import AccountService from '../services/AccountService';

export default {
    name: "meal-editor-component",
    data() {
        return {
            meal: ''
        }
    },
    methods: {
        retrieveMealByID() {
            AccountService.getMealByUri(this.$route.params.id).then(response => {
                this.meal = response.data;
            });
        }
    },

}
</script>

<style>

</style>