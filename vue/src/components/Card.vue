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
    <h2 class="recipe-name">{{ recipe.recipe.label }}</h2>
    <h3 class="statistics">
      {{ capitalize(formatArray(recipe.recipe.cuisineType)) }}
      | <span v-if="recipe.recipe.totalTime != 0">{{ recipe.recipe.totalTime }} minutes |</span>
      {{ Math.round(recipe.recipe.calories) }} calories
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

    <p>
      {{ capitalize(formatArray(recipe.recipe.dishType)) }} <br />
      {{ recipe.recipe.yield }} servings
    </p>

    <div class="label-tags">
      <label-tag
        v-for="label in recipe.recipe.dietLabels"
        v-bind:label="label"
        v-bind:key="label.id"
      />
      <label-tag
        v-for="label in recipe.recipe.healthLabels"
        v-bind:label="label"
        v-bind:key="label.id"
      />
    </div>

    <!-- <p>{{ formatArray(recipe.recipe.dietLabels) }}</p>
    <p>Dietary Tags: {{ formatArray(recipe.recipe.healthLabels) }}</p> -->
    <div></div>
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
      AccountService.removeRecipeFromFavoritesByUri(
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
  width: 300px;
  height: 505px;
  margin: 20px;
}

.main.read {
  background-color: lightgray;
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
  text-decoration: underline;
  text-align: center;
}

.card .time-to-make {
  font-size: 1rem;
}

.favorited {
  background-color: yellow;
  border: 10px solid black;
}

.statistics {
  font-size: 1rem;
  text-align: center;
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
  align-items: end;
  
}
</style>