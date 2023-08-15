<template>
  <div class="section-1">
    <div class="header-body">
      <div class="header-body-content">
        <p class="main-body-text">Find your next meal, with KiloPlanner.</p>
        <p class="second-body-text">
          Breakfast, Lunch, Dinner, or a Snack - we've got it all!
          Whether you're trying to start a new diet, or just looking for a recipe to try out, you'll find it here.
        </p>
        <router-link v-bind:to="{ name: 'search' }"
          ><button class="search-button">
            Start Looking For Recipes
          </button></router-link
        >
      </div>

      <div class="header-image">
        <img src="../../landing-page-photo.png" alt="An image of a bearded man smiling at his salad.">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      searchTerm: "",
    };
  },
};
</script>

<style scoped>
/* {
    outline: 2px solid red;
} */

body {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: auto;
}

.section-1 {
  color: #f9faf8;
  background-image: linear-gradient(to right, #0d6efd,#e5e7eb);
  width: 100%;
  height: 86.29vh;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 5px;
  margin: auto 15%;
}

.header-logo {
  font-size: 24px;
}

ul {
  list-style: none;
  display: flex;
  align-items: center;
  gap: 20px;
}

li {
  font-size: 18px;
  color: #e5e7eb;
}

li > a {
  color: white;
  text-decoration: none;
}

.header-body {
  margin: auto 15% auto 10%;
  padding-top: 100px;
  padding-bottom: 100px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.header-body-content {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.main-body-text {
  font-size: 56px;
  font-weight: bolder;
  color: #f9faf8;
  width: 35rem;
  font-family: bitter;
}

p {
  margin-top: 5px;
  margin-bottom: 5px;
  margin-right: 120px;
}

.second-body-text {
  padding-top: 10px;
  padding-bottom: 20px;
  font-size: 21px;
  color: #e5e7eb;
  font-family: bitter;
}

.search-button {
  color: white;
  background-color: #0d6efd;
  padding: 10px 30px;
  font-size: 24px;
  font-weight: bold;
  border-radius: 10px;
  outline: 2px solid white;
  margin-left: 5.25rem;
  margin-top: 2rem;
  font-family: montserrat;
}

/* .header-image {
  background-color: #e5e7eb;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 10px;
  flex: 1 1 100%;
} */

img {
    max-width: 135%;
    border-radius: 20px;
    margin-top: 1.5rem;
}
</style>