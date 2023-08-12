<template>
  <!-- <router-link v-bind:to="{ name: 'recipe', params: { uri: recipe.recipe.uri } }"> -->
  <!-- <div class="main" v-bind:class="{ favorited: favorited }">
    <img v-if="recipe.recipe.uri" v-bind:src="recipe.recipe.image" />
    <h2 class="recipe-name">{{ recipe.recipe.label }}</h2>
    <button v-if="$store.state.token != '' && favorited === false" v-on:click="addToFavorites">
      Favorite
    </button>
    <button v-if="$store.state.token != '' && favorited" v-on:click="removeFromFavorites">Unfavorite</button>
    <h3 class="time-to-make">{{ recipe.recipe.totalTime }} Mins</h3>
    <p class="calories">Calories: {{ recipe.recipe.calories }}</p>
    <p class="cuisine-type">Cuisine: {{ recipe.recipe.cuisineType }}</p>
    <p class="tags">Features: {{ combineHealthAndDietaryTags() }}</p>
  </div> -->
  <div class="main" v-bind:class="{ favorited: favorited }">
    <img
      class="image"
      v-if="recipe.recipe.uri"
      v-bind:src="recipe.recipe.image"
    />

    <div class="stats-box">
    <h2 class="recipe-name">{{ recipe.recipe.label }}</h2>
    <h3 class="statistics">
      {{ capitalize(formatArray(recipe.recipe.cuisineType)) }}
      | <span v-if="recipe.recipe.totalTime != 0">{{ recipe.recipe.totalTime }} minutes |</span>
      {{ Math.round(recipe.recipe.calories) }} calories*
    </h3>
    <div class="buttons">
      <b-button size="sm"
        class="fav-or-not"
        v-if="$store.state.token != '' && favorited === false"
        v-on:click="addToFavorites"
      >
        Add to Favorites
      </b-button>
      <b-button size="sm"
        class="fav-or-not"
        v-if="$store.state.token != '' && favorited"
        v-on:click="removeFromFavorites"
      >
        Remove from Favorites
      </b-button>
      <b-button size="sm">Add to Meal</b-button>
    </div>

    

    <div class="label-tags">
      <!-- <label-tag
        v-for="label in recipe.recipe.dietLabels"
        v-bind:label="label"
        v-bind:key="label.id"
      />
      <label-tag
        v-for="label in recipe.recipe.healthLabels"
        v-bind:label="label"
        v-bind:key="label.id"
      /> -->
      <label-tag
        v-for="label in combinedLabels"
        v-bind:label="label"
        v-bind:key="label.id"
      />
    </div>
    <div class="dish-and-yield">
      <!-- {{ capitalize(formatArray(recipe.recipe.dishType)) }} -->
      *Makes {{ recipe.recipe.yield }} servings
  </div>
    </div>

    <!-- <p>{{ formatArray(recipe.recipe.dietLabels) }}</p>
    <p>Dietary Tags: {{ formatArray(recipe.recipe.healthLabels) }}</p> -->
  </div>
</template>

<script>
import AccountService from "../services/AccountService.js";
import LabelTag from "./LabelTag.vue";

export default {
  name: "card",
  components: {
    LabelTag,
  },
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
  computed: {
    combinedLabels() {
      // return this.recipe.recipe.dietLabels.slice(0,2).concat(this.recipe.recipe.healthLabels.slice(0, 6));
      const maxDietLabels = 4;
      const maxHealthLabels = 4;
      const maxTotalLabels = 8;

      let dietLabels = this.recipe.recipe.dietLabels.slice(0, maxDietLabels);
      let healthLabels = this.recipe.recipe.healthLabels.slice(0, maxHealthLabels);

      if(dietLabels.length < maxDietLabels) {
        healthLabels = this.recipe.recipe.healthLabels.slice(0, maxHealthLabels +(maxDietLabels - dietLabels.length));
      }


      if(healthLabels.length < maxHealthLabels) {
        dietLabels = this.recipe.recipe.dietLabels.slice(0, maxDietLabels + (maxHealthLabels - healthLabels.length));
      }

      return dietLabels.concat(healthLabels).slice(0, maxTotalLabels);
    },
  },
  methods: {
    combineHealthAndDietaryTags() {
      return this.recipe.recipe.healthLabels.concat(
        this.recipe.recipe.dietLabels
      );
    },
    addToFavorites() {
      AccountService.addRecipeToFavorites(this.formatRecipe()).then(
        (response) => {
          return response.status == 200; //change to 201 when server status codes updated
        }
      );
      this.favorited = true;
    },
    removeFromFavorites() {
      console.log("entered removal function");
      AccountService.removeRecipeFromFavorites(
        this.recipe.recipe.uri
      ).then((response) => {
        console.log("removal in process");
        return response.status == 200;
      });
      this.favorited = false;
    },
    formatRecipe() {
      const formattedRecipe = {
        recipe_id: 0,
        uri: this.recipe.recipe.uri,
        label: this.recipe.recipe.label,
        img: this.recipe.recipe.image,
        calories: Math.round(this.recipe.recipe.calories),
        yield: this.recipe.recipe.yield,
        cuisineType: this.recipe.recipe.cuisineType[0],
        totalTime: this.recipe.recipe.totalTime,
      };
      console.log(formattedRecipe);
      return formattedRecipe;
    },
    capitalize(string) {
      console.log("enter capitalize");
      const firstLetter = string.charAt(0).toUpperCase();
      console.log(firstLetter);
      string = firstLetter + string.substring(1);
      console.log(firstLetter + string.substring(1));
      console.log(string);
      return string;
    },
    formatArray(array) {
      let newString = "";

      for (let counter = 0; counter < array.length; counter++) {
        newString += array[counter];
        if (counter < array.length - 1) {
          newString += ", ";
        }
      }

      return newString;
    },
  },
};
</script>

<style>
.main {
  border: 2px solid black;
  border-radius: 10px;
  display: inline-block;
  width: 250px;
  height: 475px;
  margin: 20px;
  background-color: white;
  font-family: bitter;
}


.main img {
  width: 100%;
  height: 40%;
  border-top: 1px solid black;
  border-left: 1px solid black;
  border-right: 1px solid black;
  border-bottom: 3px solid black;
}

.main .recipe-name {
  font-size: 1.2rem;
  text-align: center;
  font-family: dosis;
  font-weight: 700;
  margin-bottom: 0px;
}


.favorited {
  background-color: yellow;
  border: 10px solid black;
}

.statistics {
  font-size: .8rem;
  text-align: center;
  margin-top: 0rem;  

}

.buttons {
  text-align: center;
}

.fav-or-not {
  margin-right: 6px;
}

.label-tags {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin-top: 1rem;
  padding-bottom: .3rem;
}

.stats-box {
  height: 18rem;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  padding-top: .5rem;
  padding-bottom: .5rem;
}

.dish-and-yield {
  font-size: .7rem;
  text-align: center;
}

</style>