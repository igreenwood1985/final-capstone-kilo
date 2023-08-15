package com.techelevator.dao;

import com.techelevator.model.MealDTO;
import com.techelevator.model.MealPlanDTO;
import com.techelevator.model.RecipeDto;
import org.springframework.dao.DataIntegrityViolationException;
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
    public List<MealPlanDTO> retrieveAllMealPlans(int userId) {
        List<MealPlanDTO> mealPlanList = new ArrayList<>();
        String mealPlanSQL = "SELECT meal_plan_id, meal_plan_name, description, user_id " +
                "FROM meal_plans " +
                "WHERE user_id = ?;";

        try{
            SqlRowSet result = jdbcTemplate.queryForRowSet(mealPlanSQL, userId);
            while (result.next()){
                MealPlanDTO mealPlan = mapMealPlan(result);

                String mealSql = "SELECT meals.meal_id, meal_name, description, user_id " +
                        "FROM meals " +
                        "JOIN meal_plan_meal ON meals.meal_id = meal_plan_meal.meal_id " +
                        "WHERE meal_plan_id = ?";
                SqlRowSet mealResult = jdbcTemplate.queryForRowSet(mealSql, mealPlan.getMealPlanId());
                while(mealResult.next()){
                   MealDTO meal = mapMeal(mealResult);
                   String recipeSql = "SELECT recipes.recipe_id, uri, recipe_name, img, total_calories, servings, cuisine_type, total_time " +
                           "FROM recipes " +
                           "JOIN meal_recipe ON recipes.recipe_id = meal_recipe.recipe_id " +
                           "WHERE meal_id = ?";
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

    @Override
    public MealPlanDTO retrieveMealPlanByID(int mealPlanID, int userID) {
        MealPlanDTO mealPlan = null;
        String sql = "SELECT meal_plan_id, meal_plan_name, description, user_id " +
                "FROM meal_plans " +
                "WHERE meal_plan_id = ? AND user_id = ?";

        try {
            SqlRowSet result = jdbcTemplate.queryForRowSet(sql, mealPlanID, userID);

            if (result.next()) {
                mealPlan = mapMealPlan(result);

                String mealSql = "SELECT meals.meal_id, meal_name, description, user_id " +
                        "FROM meals " +
                        "JOIN meal_plan_meal ON meals.meal_id = meal_plan_meal.meal_id " +
                        "WHERE meal_plan_id = ?";
                SqlRowSet mealResult = jdbcTemplate.queryForRowSet(mealSql, mealPlan.getMealPlanId());
                while(mealResult.next()){
                    MealDTO meal = mapMeal(mealResult);
                    String recipeSql = "SELECT recipes.recipe_id, uri, recipe_name, img, total_calories, servings, cuisine_type, total_time " +
                            "FROM recipes " +
                            "JOIN meal_recipe ON recipes.recipe_id = meal_recipe.recipe_id " +
                            "WHERE meal_id = ?";
                    SqlRowSet recipeResult = jdbcTemplate.queryForRowSet(recipeSql, meal.getMeal_id());
                    while(recipeResult.next()){
                        RecipeDto recipe = mapRecipeDTO(recipeResult);
                        meal.addToRecipes(recipe);
                    }
                    mealPlan.addToMeals(meal);
                }
            }
        } catch (CannotGetJdbcConnectionException exception) {

        }

        return mealPlan;
    }

    @Override
    public void addMealPlan(MealPlanDTO mealPlan, int userID) {
        String sql = "INSERT INTO meal_plans (meal_plan_name, description, user_id) " +
                "VALUES (?, ?, ?) RETURNING meal_plan_id;";

        String createTemplateSql = "INSERT INTO meal_plan_meal (meal_plan_id, meal_id)" +
                "VALUES (?, 69)";

        try {
            int mealPlanId = jdbcTemplate.queryForObject(sql, Integer.class, mealPlan.getName(), mealPlan.getDescription(), userID);
            jdbcTemplate.queryForRowSet(createTemplateSql, mealPlanId);

        } catch (CannotGetJdbcConnectionException exception) {

        } catch (DataIntegrityViolationException exception) {

        }
    }

    @Override
    public void updateMealPlan(MealPlanDTO mealPlan) {
        String sqlName = "UPDATE meal_plans " +
                "SET meal_plan_name = ? " +
                "WHERE meal_plan_id = ?;";
        String sqlDescription = "UPDATE meal_plans " +
                "SET description = ? " +
                "WHERE meal_plan_id = ?;";

        try {
            jdbcTemplate.update(sqlName, mealPlan.getName(), mealPlan.getMealPlanId());
            jdbcTemplate.update(sqlDescription, mealPlan.getDescription(), mealPlan.getMealPlanId());

        } catch (CannotGetJdbcConnectionException exception) {

        } catch (DataIntegrityViolationException exception) {

        }
    }

    @Override
    public void deleteMealPlan(int mealPlanID) {
        String joinSql = "DELETE FROM meal_plan_meal " +
                "WHERE meal_plan_id = ?;";

        String mealPlanSql = "DELETE FROM meal_plans " +
                "WHERE meal_plan_id = ?;";

        try {
            jdbcTemplate.update(joinSql, mealPlanID);
            jdbcTemplate.update(mealPlanSql, mealPlanID);
        } catch (CannotGetJdbcConnectionException exception) {

        } catch (DataIntegrityViolationException exception) {

        }
    }

    @Override
    public void addMealToMealPlan(int mealPlanID, int mealID) {
        String sql = "INSERT INTO meal_plan_meal (meal_plan_id, meal_id) " +
                "VALUES (?, ?);";

        try {
            jdbcTemplate.update(sql, mealPlanID, mealID);

        } catch (CannotGetJdbcConnectionException exception) {

        } catch (DataIntegrityViolationException exception) {

        }
    }

    @Override
    public void removeMealFromMealPlan(int mealPlanID, int mealID) {
        String sql = "DELETE FROM meal_plan_meal " +
                "WHERE meal_plan_id = ? AND meal_id = ?;";

        try {
            jdbcTemplate.update(sql, mealPlanID, mealID);

        } catch (CannotGetJdbcConnectionException exception) {

        } catch (DataIntegrityViolationException exception) {

        }
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
        mealPlan.setName(result.getString("meal_plan_name"));
        mealPlan.setDescription(result.getString("description"));
        mealPlan.setUserId(result.getInt("user_id"));

        return mealPlan;
    }
}
