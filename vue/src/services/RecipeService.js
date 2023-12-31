import axios from 'axios';

const http = axios.create({
  baseURL: "https://api.edamam.com/api/recipes/v2/"
});

const apiID = 'c7b68cc6';
const apiKey = 'c762d2cccc3e9b4e25bfae894da50cd9';

//Search Reference URL
//https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=Chicken&app_id=be14acd0&app_key=b9156f49c2db2a7389974ba9261c3628&random=true

//&random=true limits results to 20

//Search by URI reference URL
//https://api.edamam.com/api/recipes/v2/by-uri?type=public&beta=false&uri=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_e4108dbf7f340c9b08592e57e669353f&app_id=be14acd0&app_key=b9156f49c2db2a7389974ba9261c3628&field=uri&field=label&field=image&field=images&field=source&field=url&field=shareAs&field=yield&field=dietLabels&field=healthLabels&field=cautions&field=ingredientLines&field=ingredients&field=calories&field=glycemicIndex&field=totalCO2Emissions&field=co2EmissionsClass&field=totalWeight&field=totalTime&field=cuisineType&field=mealType&field=dishType&field=totalNutrients&field=totalDaily&field=digest&field=tags&field=externalId

export default {


    getRecipes(searchTerm) {
        return http.get('?type=public&beta=false&q=' + searchTerm + '&app_id=' + apiID + '&app_key=' + apiKey + '&random=true');
    },

    getFilteredRecipes(searchTerm, filtersArray) {
      let appends = "";
      filtersArray.forEach((item) => {
        appends += item;
      })
      return http.get('?type=public&beta=false&q=' + searchTerm + '&app_id=' + apiID + '&app_key=' + apiKey + '&random=true' + appends);
    },

    getRecipeByUri(uri) {
      
      uri = uri.replaceAll('/', '%2F')
      uri = uri.replaceAll(':', '%3A')
      uri = uri.replaceAll('#', '%23')
      return http.get('by-uri?type=public&beta=false&uri=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23' + uri + '&app_id=' + apiID + '&app_key=' + apiKey + '&field=uri&field=label&field=image&field=images&field=source&field=url&field=shareAs&field=yield&field=dietLabels&field=healthLabels&field=cautions&field=ingredientLines&field=ingredients&field=calories&field=glycemicIndex&field=totalCO2Emissions&field=co2EmissionsClass&field=totalWeight&field=totalTime&field=cuisineType&field=mealType&field=dishType&field=totalNutrients&field=totalDaily&field=digest&field=tags&field=externalId');
    }

}