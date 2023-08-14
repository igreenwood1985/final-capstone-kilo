<template>
  <div>
    <meal-card
      v-for="meal in updateMeals"
      v-bind:meal="meal"
      v-bind:key="meal.id"
      v-bind:enable-add="true"
      v-show="updateMeals.length !== 0"
    />
    <h1 class="empty-recipes-message" v-show="updateMeals.length == 0">You do not currently have any meals.</h1>
  </div>
</template>

<script>
import AccountService from "../services/AccountService";
import MealCard from "../components/MealCard.vue";

export default {
  name: "dashboard-meals",
  components: {
    MealCard,
  },
  data() {
    return {
      favoriteMeals: [],
      componentKey: 0,
    };
  },
  computed: {
    updateMeals() {
      return this.$store.state.meals;
    }
  },
  methods: {
    getFavoriteMeals() {
      AccountService.getDashboardMeals().then((response) => {
        this.$store.commit('SET_MEALS', response.data);
      });
    },
    forceRefresh() {
      this.componentKey += 1;
    },
  },
  created() {
    this.getFavoriteMeals();
  },
};
</script>

<style scoped>
.heading {
  display: block;
}

.empty-recipes-message {
  text-align: center;
  font-size: 1.5rem;
  padding: 104px
}
</style>