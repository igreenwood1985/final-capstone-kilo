import axios from 'axios';

const http = axios.create({
  baseURL: "/"
  
});
export default{
getFavoritedRecipes(){
    return http.get('dashboard')
},
addRecipeToFavorites(recipe){
    return http.post('', recipe)
},
removeRecipeToFavorites(recipe){
    return http.delete('', recipe)
},
getRecipeById(id){
    return http.get('/' + id)
}
}