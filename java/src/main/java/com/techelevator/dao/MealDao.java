package com.techelevator.dao;

import com.techelevator.model.MealDTO;

import java.util.List;

public interface MealDao {

    public List<MealDTO> retrieveAllMeals(int user_id);
    public List<MealDTO> retrieveDashboardMeals(int user_id);

    public MealDTO createMeal(int user_id, MealDTO meal);
    public MealDTO retrieveMealByID(int user_id, int meal_id);

}
