package com.techelevator.dao;

import com.techelevator.model.RecipeDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRecipeDao implements RecipeDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcRecipeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<RecipeDto> getAllFavoritedRecipes(int userId) {
        RecipeDto returnedRecipe = new RecipeDto();
        List<RecipeDto> recipeDtoList = new ArrayList<>();

        String sql = "SELECT recipes.recipe_id, recipe_name, ingredients, instructions " +
                "FROM recipes " +
                "JOIN user_recipe ON user_recipe.recipe_id = recipes.recipe_id " +
                "WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql,userId);
       while(results.next()){
           returnedRecipe = mapRowToRecipe(results);
           recipeDtoList.add(returnedRecipe);

       }




        return recipeDtoList;
    }


    private RecipeDto mapRowToRecipe(SqlRowSet rowset){

        RecipeDto recipeDto = new RecipeDto();
         recipeDto.setRecipe_id(rowset.getInt("recipe_id"));
         recipeDto.setRecipe_name(rowset.getString("recipe_name"));
         recipeDto.setIngredients(rowset.getString("ingredients"));
         recipeDto.setInstructions(rowset.getString("instructions"));
         return recipeDto;



    }
}
