import axios from 'axios';

const http = axios.create({
  baseURL: "https://api.edamam.com/api/recipes/v2/"
});

const apiID = 'be14acd0';
const apiKey = 'b9156f49c2db2a7389974ba9261c3628';

//https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=Chicken&app_id=be14acd0&app_key=b9156f49c2db2a7389974ba9261c3628&random=true

//&random=true limits results to 20

export default {


    getRecipes(searchTerm) {
        
        return http.get('?type=public&beta=false&q=' + searchTerm + '&app_id=' + apiID + '&app_key=' + apiKey + '&random=true');
    }

}