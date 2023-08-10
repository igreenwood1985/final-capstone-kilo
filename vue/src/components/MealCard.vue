<template>
  <div>

  </div>
</template>

<script>


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



  },



  }


</script>

<style>

</style>