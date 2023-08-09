package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.RecipeDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRecipeDao implements RecipeDao {
    private final JdbcTemplate jdbcTemplate;
    private String label;

    public JdbcRecipeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<RecipeDto> getDashboardRecipes(int userId) {
        RecipeDto returnedRecipe = new RecipeDto();
        List<RecipeDto> recipeDtoList = new ArrayList<>();

        String sql = "SELECT recipes.recipe_id, uri, recipe_name, img, total_calories, servings, cuisine_type, total_time " +
                "FROM recipes " +
                "JOIN user_recipe ON user_recipe.recipe_id = recipes.recipe_id " +
                "WHERE user_id = ?" +
                "ORDER BY recipe_id DESC";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);

        while (results.next()) {
            returnedRecipe = mapRowToRecipe(results);
            recipeDtoList.add(returnedRecipe);
        }
        return recipeDtoList;
    }

    @Override
    public List<RecipeDto> getAllFavoritedRecipes(int userId) {
        RecipeDto returnedRecipe = new RecipeDto();
        List<RecipeDto> recipeDtoList = new ArrayList<>();

        String sql = "SELECT recipes.recipe_id, uri, recipe_name, img, total_calories, servings, cuisine_type, total_time " +
                "FROM recipes " +
                "JOIN user_recipe ON user_recipe.recipe_id = recipes.recipe_id " +
                "WHERE user_id = ?" +
                "ORDER BY recipe_id DESC";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);

        while (results.next()) {
            returnedRecipe = mapRowToRecipe(results);
            recipeDtoList.add(returnedRecipe);
        }
        return recipeDtoList;
    }

    @Override
    public RecipeDto addFavoriteRecipe (RecipeDto recipeDto, int userId) {

        // Checks to see if received Recipe is already in the database
        String checkerSql = "SELECT recipe_id, uri FROM recipes " +
                "WHERE uri = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(checkerSql, recipeDto.getUri());

        // If it is, check to see if it is already attached to logged in user
        if (results.next()) {
            String joinCheckerSql = "SELECT user_id, recipe_id FROM user_recipe " +
                    "WHERE user_id = ? AND recipe_id = ?";
            SqlRowSet joinResults = jdbcTemplate.queryForRowSet(joinCheckerSql, userId, results.getInt("recipe_id"));

            // If no results populate based on logged in user id and desired recipe to favorite, add to the join table
            if (!joinResults.next()) {
                String joinSql = "INSERT INTO user_recipe (user_id, recipe_id) " +
                        "VALUES (?, ?)";
                jdbcTemplate.update(joinSql, userId, results.getInt("recipe_id"));
            }
            else {
                throw new DaoException("Recipe is already in user's 'Favorites' list.");
            }
            recipeDto.setRecipe_id(results.getInt("recipe_id"));
            // If recipe is not in database, add it, and connect it to the user via join table
        } else {
            String insertSql = "INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, " +
                    "cuisine_type, total_time) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?) " +
                    "RETURNING recipe_id";
            int recipeId = jdbcTemplate.queryForObject(insertSql, int.class, recipeDto.getUri(), recipeDto.getLabel(),
                    recipeDto.getImg(), recipeDto.getCalories(), recipeDto.getYield(), recipeDto.getCuisineType(),
                    recipeDto.getTotalTime());
            String joinSql = "INSERT INTO user_recipe (user_id, recipe_id) " +
                    "VALUES (?, ?)";
            jdbcTemplate.update(joinSql, userId, recipeId);
            recipeDto.setRecipe_id(recipeId);
        }

        return recipeDto;
    }

    // Remove a recipe from logged in user's favorites
    @Override
    public void removeRecipeFromFavorites(int recipeId, int userId) {

            String sql = "DELETE FROM user_recipe WHERE user_id = ? AND recipe_id = ?";
            jdbcTemplate.update(sql, userId, recipeId);

    }

    @Override
    public void removeRecipeFromFavoritesByUri(String recipeUri, int userId) {
        String sqlSelect = "SELECT recipe_id " +
                "FROM recipes " +
                "WHERE uri = ?";

        String sqlDelete = "DELETE FROM user_recipe " +
                "WHERE user_id = ? AND recipe_id = ?";
        int recipe_id = jdbcTemplate.queryForObject(sqlSelect, Integer.class, recipeUri);

        jdbcTemplate.update(sqlDelete, userId, recipe_id);
    }

    private RecipeDto mapRowToRecipe(SqlRowSet rowset) {
        RecipeDto recipeDto = new RecipeDto();
        recipeDto.setRecipe_id(rowset.getInt("recipe_id"));
        recipeDto.setUri(rowset.getString("uri"));
        recipeDto.setLabel(rowset.getString("recipe_name"));
        recipeDto.setImg(rowset.getString("img"));
        recipeDto.setCalories(rowset.getDouble("total_calories"));
        recipeDto.setYield(rowset.getInt("servings"));
        recipeDto.setCuisineType(rowset.getString("cuisine_type"));
        recipeDto.setTotalTime(rowset.getInt("total_time"));
        return recipeDto;
    }
}
