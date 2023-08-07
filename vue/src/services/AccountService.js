import axios from 'axios';

export default {
    getFavoritedRecipes() {
        return axios.get('dashboard');
    },
    addRecipeToFavorites(recipe) {
        return axios.post('', recipe);
    },
    removeRecipeToFavorites(recipe) {
        return axios.delete('', recipe);
    },
    getRecipeById(id) {
        return axios.get('/' + id);
    }
}