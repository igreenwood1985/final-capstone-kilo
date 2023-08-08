import axios from 'axios';

export default {
    getFavoritedRecipes() {
        return axios.get('/dashboard/recipes');
    },
    addRecipeToFavorites(recipe) {
        return axios.post('/dashboard', recipe);
    },
    removeRecipeToFavorites(recipe) {
        return axios.delete('/', recipe);
    },
    getRecipeById(id) {
        return axios.get('/' + id);
    }
}