package com.techelevator.dao;

import com.techelevator.model.MealDTO;
import com.techelevator.model.RecipeDto;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMealDao implements MealDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcMealDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<MealDTO> getAllMeals(int user_id) {
        List<MealDTO> allMeals = new ArrayList<>();
        String sql = "SELECT meal_id, meal_name, description " +
                "FROM meals " +
                "WHERE user_id = ?;";

        String sqlRecipes = "SELECT recipes.recipe_id, recipe_name, uri, img, total_calories, servings, cuisine_type, total_time FROM recipes " +
                "JOIN meal_recipe ON recipes.recipe_id = meal_recipe.recipe_id " +
                "JOIN meals ON meal_recipe.meal_id = meals.meal_id " +
                "WHERE meals.meal_id = ?;";
        try{
            SqlRowSet result = jdbcTemplate.queryForRowSet(sql, user_id);
            while(result.next()){
                MealDTO meal = mapMealDTO(result);
                SqlRowSet result2 = jdbcTemplate.queryForRowSet(sqlRecipes, meal.getMeal_id());
                while (result2.next()){
                    RecipeDto recipe = mapRecipeDTO(result2);
                    meal.addToRecipes(recipe);
                }
                allMeals.add(meal);



            }

        }
        catch (CannotGetJdbcConnectionException exception){

        }

        return allMeals;

    }
    private MealDTO mapMealDTO(SqlRowSet result){
        MealDTO meal = new MealDTO();
        meal.setMeal_id(result.getInt("meal_id"));
        meal.setName(result.getString("meal_name"));
        meal.setDescription(result.getString("description"));
        return meal;
    }

    private RecipeDto mapRecipeDTO(SqlRowSet result){
        RecipeDto recipe = new RecipeDto();
        recipe.setRecipe_id(result.getInt("recipe_id"));
        recipe.setLabel(result.getString("recipe_name"));
        recipe.setUri(result.getString("uri"));
        recipe.setImg(result.getString("img"));
        recipe.setCalories(result.getDouble("total_calories"));
        recipe.setYield(result.getInt("servings"));
        recipe.setCuisineType(result.getString("cuisine_type"));
        recipe.setTotalTime(result.getInt("total_time"));
        return recipe;
    }
}
