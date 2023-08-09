import axios from 'axios';

export default {
    getFavoritedRecipes() {
        return axios.get('/dashboard/recipes');
    },
    addRecipeToFavorites(recipe) {
        const uriIndex = recipe.uri.indexOf('#');
        recipe.uri = recipe.uri.substring(uriIndex + 1);
        console.log(recipe.uri);
        return axios.post('/dashboard', recipe);
    },
    removeRecipeFromFavorites(recipeId) {
        return axios.delete('/myrecipes/' +  recipeId);
    },
    getRecipeById(id) {
        return axios.get('/' + id);
    },
    removeRecipeFromFavoritesByUri(recipeUri) {
        const uriIndex = recipeUri.indexOf('#');
        recipeUri = recipeUri.substring(uriIndex + 1);
        console.log(recipeUri);
        return axios.delete('/myrecipes/' +  recipeUri);
    },
}