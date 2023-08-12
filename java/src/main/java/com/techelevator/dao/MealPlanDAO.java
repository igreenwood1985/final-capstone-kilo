package com.techelevator.dao;

import com.techelevator.model.MealPlanDTO;

import java.util.ArrayList;
import java.util.List;

public interface MealPlanDAO {
    public List<MealPlanDTO> retrieveAllMealPlans(int userId);
    public MealPlanDTO retrieveMealPlanByID(int mealPlanID, int userID);
    public void addMealPlan(MealPlanDTO mealPlan, int userID);
    public void updateMealPlan(MealPlanDTO mealPlan);
    public void deleteMealPlan(int mealPlanID);
    public void addMealToMealPlan(int mealPlanID, int mealID);
    public void removeMealFromMealPlan(int mealPlanID, int mealID);
}
