package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.MealDTO;
import com.techelevator.model.RecipeDto;
import org.springframework.dao.DataIntegrityViolationException;
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
    public List<MealDTO> retrieveAllMeals(int user_id) {
        List<MealDTO> allMeals = new ArrayList<>();
        String sqlMeals = "SELECT meal_id, meal_name, description " +
                "FROM meals " +
                "WHERE user_id = ?;";

        String sqlRecipes = "SELECT recipes.recipe_id, recipe_name, uri, img, total_calories, servings, cuisine_type, total_time FROM recipes " +
                "JOIN meal_recipe ON recipes.recipe_id = meal_recipe.recipe_id " +
                "JOIN meals ON meal_recipe.meal_id = meals.meal_id " +
                "WHERE meals.meal_id = ?;";
        try{
            SqlRowSet resultMeals = jdbcTemplate.queryForRowSet(sqlMeals, user_id);
            while(resultMeals.next()){
                MealDTO meal = mapMealDTO(resultMeals);
                SqlRowSet resultRecipes = jdbcTemplate.queryForRowSet(sqlRecipes, meal.getMeal_id());
                while (resultRecipes.next()){
                    RecipeDto recipe = mapRecipeDTO(resultRecipes);
                    meal.addToRecipes(recipe);
                }

                allMeals.add(meal);

            }

        }
        catch (CannotGetJdbcConnectionException exception){
            throw new DaoException("Unable to connect to server or database", exception);
        }

        return allMeals;

    }

    @Override
    public List<MealDTO> retrieveDashboardMeals(int user_id) {
        List<MealDTO> allMeals = new ArrayList<>();
        String sqlMeals = "SELECT meal_id, meal_name, description " +
                "FROM meals " +
                "WHERE user_id = ? " +
                "ORDER BY meal_id DESC " +
                "LIMIT 3;";

        String sqlRecipes = "SELECT recipes.recipe_id, recipe_name, uri, img, total_calories, servings, cuisine_type, total_time FROM recipes " +
                "JOIN meal_recipe ON recipes.recipe_id = meal_recipe.recipe_id " +
                "JOIN meals ON meal_recipe.meal_id = meals.meal_id " +
                "WHERE meals.meal_id = ?;";
        try{
            SqlRowSet resultMeals = jdbcTemplate.queryForRowSet(sqlMeals, user_id);
            while(resultMeals.next()){
                MealDTO meal = mapMealDTO(resultMeals);
                SqlRowSet resultRecipes = jdbcTemplate.queryForRowSet(sqlRecipes, meal.getMeal_id());
                while (resultRecipes.next()){
                    RecipeDto recipe = mapRecipeDTO(resultRecipes);
                    meal.addToRecipes(recipe);
                }

                allMeals.add(meal);

            }

        }
        catch (CannotGetJdbcConnectionException exception){
            throw new DaoException("Unable to connect to server or database", exception);
        }

        return allMeals;

    }

    @Override
    public MealDTO createMeal(int user_id, MealDTO meal) {
        String sql ="INSERT INTO meals (meal_name, description, user_id) " +
                "VALUES (?,?,?) RETURNING meal_id;";

        String sqlJoin = "INSERT INTO meal_recipe (meal_id, recipe_id) " +
                "VALUES (?, ?);";
        try{
            int mealID = jdbcTemplate.queryForObject(sql, Integer.class, meal.getName(), meal.getDescription(), user_id);
            meal.setMeal_id(mealID);
//            for(int counter = 0;  ){
//
//            }
        } catch(CannotGetJdbcConnectionException exception){

        } catch(DataIntegrityViolationException exception){

        }

        return meal;
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
