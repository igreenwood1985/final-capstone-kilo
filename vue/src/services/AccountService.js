import axios from 'axios';

export default {
    getFavoritedRecipes() {
        return axios.get('/dashboard/recipes');
    },
    addRecipeToFavorites(recipe) {
        return axios.post('/dashboard', recipe);
    },
    removeRecipeFromFavorites(recipeId) {
        return axios.delete('/myrecipes/' +  recipeId);
    },
    getRecipeById(id) {
        return axios.get('/' + id);
    }
}