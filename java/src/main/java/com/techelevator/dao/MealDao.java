package com.techelevator.dao;

import com.techelevator.model.MealDTO;

import java.util.List;

public interface MealDao {

    public List<MealDTO> retrieveAllMeals(int userId);
    public List<MealDTO> retrieveDashboardMeals(int userId);

    public MealDTO createMeal(int userId, MealDTO meal);
    public MealDTO retrieveMealByID(int userId, int mealId);
    public void addRecipeToMeal(int recipeId, int mealId);
    public void removeRecipeFromMeal(int recipeId, int mealId);
    public void deleteMeal(int mealId);

}
