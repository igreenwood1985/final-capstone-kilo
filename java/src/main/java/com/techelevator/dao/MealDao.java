package com.techelevator.dao;

import com.techelevator.model.MealDTO;

import java.util.List;

public interface MealDao {

    public List<MealDTO> getAllMeals(int user_id);

}
