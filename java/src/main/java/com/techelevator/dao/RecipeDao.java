package com.techelevator.dao;

import com.techelevator.model.RecipeDto;

import java.util.List;

public interface RecipeDao {


    public List<RecipeDto> getAllFavoritedRecipes(int userId);

}
