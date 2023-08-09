<template>
  <div class="home">
    <home />
    <search-results />
  </div>
</template>

<script>
import Home from '../components/Home.vue';
import SearchResults from '../components/SearchResults.vue';

export default {
  components: {
    Home,
    SearchResults
  }

};
</script>