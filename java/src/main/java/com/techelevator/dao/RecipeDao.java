package com.techelevator.dao;

import com.techelevator.model.RecipeDto;

import java.util.List;

public interface RecipeDao {


    public List<RecipeDto> getAllFavoritedRecipes(int userId);
    public List<RecipeDto> getDashboardRecipes(int userId);
    public RecipeDto addFavoriteRecipe(RecipeDto recipeDto, int userId);
    public void removeRecipeFromFavorites(int recipeId ,int userId);
    public void removeRecipeFromFavoritesByUri(String recipeUri, int userId);

}
