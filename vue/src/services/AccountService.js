import axios from 'axios';

export default {
    //Recipes 
    getDashboardRecipes() {
        return axios.get('/dashboard/recipes');
    },
    getFavoritedRecipes(){
        return axios.get('/myrecipes')
    },
    addRecipeToFavorites(recipe) {
        const uriIndex = recipe.uri.indexOf('#');
        recipe.uri = recipe.uri.substring(uriIndex + 1);
        console.log(recipe.uri);
        return axios.post('/addrecipe', recipe);
    },
    removeRecipeFromFavorites(recipeUri) {
        const uriIndex = recipeUri.indexOf('#');
        recipeUri = recipeUri.substring(uriIndex + 1);
        console.log(recipeUri);
        return axios.delete('/myrecipes/' +  recipeUri);
    },
    getRecipeById(id) {
        return axios.get('/' + id);
    },
    //Meals
    getDashboardMeals(){
        return axios.get('/dashboard/meals')
    },
    getFavoritedMeals(){
        return axios.get('/mymeals')
    },
    createMeal(meal) {
        return axios.post('/createmeal', meal)
    }
}