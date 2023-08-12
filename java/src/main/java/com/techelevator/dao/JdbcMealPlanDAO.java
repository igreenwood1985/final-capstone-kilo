package com.techelevator.dao;

import com.techelevator.model.MealDTO;
import com.techelevator.model.MealPlanDTO;
import com.techelevator.model.RecipeDto;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMealPlanDAO implements MealPlanDAO{

    private JdbcTemplate jdbcTemplate;
    private JdbcMealDao mealDao = new JdbcMealDao(jdbcTemplate);
    private JdbcRecipeDao recipeDao = new JdbcRecipeDao(jdbcTemplate);

    public JdbcMealPlanDAO(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<MealPlanDTO> retrieveAllMeals(int userId) {
        List<MealPlanDTO> mealPlanList = new ArrayList<>();
        String mealPlanSQL = "SELECT meal_plan_id, meal_plan_name, description, user_id " +
                "FROM meal_plans " +
                "WHERE user_id = ?;";

        try{
            SqlRowSet result = jdbcTemplate.queryForRowSet(mealPlanSQL, userId);
            while (result.next()){
                MealPlanDTO mealPlan = mapMealPlan(result);

                String mealSql = "";
                SqlRowSet mealResult = jdbcTemplate.queryForRowSet(mealSql, mealPlan.getMealPlanId());
                while(mealResult.next()){
                   MealDTO meal = mapMeal(mealResult);
                   String recipeSql = "";
                   SqlRowSet recipeResult = jdbcTemplate.queryForRowSet(recipeSql, meal.getMeal_id());
                   while(recipeResult.next()){
                       RecipeDto recipe = mapRecipeDTO(recipeResult);
                       meal.addToRecipes(recipe);
                   }
                   mealPlan.addToMeals(meal);
                }
                mealPlanList.add(mealPlan);

            }
        } catch(CannotGetJdbcConnectionException exception){

        }
        return mealPlanList;
    }

    private RecipeDto mapRecipeDTO(SqlRowSet result) {
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

    private MealDTO mapMeal(SqlRowSet result){
        MealDTO meal = new MealDTO();
        meal.setMeal_id(result.getInt("meal_id"));
        meal.setName(result.getString("meal_name"));
        meal.setDescription(result.getString("description"));
        meal.setUser_id(result.getInt("user_id"));

        return meal;
    }
    private MealPlanDTO mapMealPlan(SqlRowSet result){
        MealPlanDTO mealPlan = new MealPlanDTO();
        mealPlan.setMealPlanId(result.getInt("meal_plan_id"));
        mealPlan.setMealPlanName(result.getString("meal_plan_name"));
        mealPlan.setDescription(result.getString("description"));
        mealPlan.setUserId(result.getInt("user_id"));

        return mealPlan;
    }
}
