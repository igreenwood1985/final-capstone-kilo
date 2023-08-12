package com.techelevator.dao;

import com.techelevator.model.MealPlanDTO;

import java.util.ArrayList;
import java.util.List;

public interface MealPlanDAO {
    public List<MealPlanDTO> retrieveAllMeals(int userId);
}
