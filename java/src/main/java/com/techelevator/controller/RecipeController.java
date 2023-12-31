package com.techelevator.controller;


import com.techelevator.dao.RecipeDao;
import com.techelevator.dao.UserDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.RecipeDto;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class RecipeController {

    private RecipeDao recipeDao;
    private UserDao userDao;
    public RecipeController(RecipeDao recipeDao, UserDao userDao){
        this.recipeDao = recipeDao;
        this.userDao = userDao;
    }

    // Gets 4 most recent favorited recipes from logged in users for Dashboard component
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/dashboard/recipes",method = RequestMethod.GET)
    public RecipeDto[] getDashboardRecipes(Principal principal) {
        List<RecipeDto> recipeDtoList =  recipeDao.getDashboardRecipes(getLoggedInUserId(principal));
        return recipeDtoList.toArray(new RecipeDto[recipeDtoList.size()]);
    }

    // Gets ALL favorited recipes from logged in users
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/myrecipes",method = RequestMethod.GET)
    public RecipeDto[] getAllFavoritedRecipes(Principal principal) {
        List<RecipeDto> recipeDtoList =  recipeDao.getAllFavoritedRecipes(getLoggedInUserId(principal));
        return recipeDtoList.toArray(new RecipeDto[recipeDtoList.size()]);
    }

    // Add recipe to favorites
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addrecipe", method = RequestMethod.POST)
    public RecipeDto addFavoriteRecipe(@RequestBody RecipeDto recipeDto, Principal principal) {
       try {
           RecipeDto responseRecipeDto = recipeDao.addFavoriteRecipe(recipeDto, getLoggedInUserId(principal));
           return responseRecipeDto;
       } catch (DaoException e) {
           System.out.println(e.getMessage());
           return null;
       }
    }

    // Remove recipe from favorites using partial uri to access the recipe within the database
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/myrecipes/{recipeUri}", method = RequestMethod.DELETE)
    public void removeRecipeFromFavoritesByUri(@PathVariable String recipeUri, Principal principal){
        recipeDao.removeRecipeFromFavoritesByUri(recipeUri, getLoggedInUserId(principal));
    }

    // Returns logged in user's usedId
    private int getLoggedInUserId(Principal principal) {
        String username = principal.getName();
        User loggedInUser = userDao.getUserByUsername(username);
        return loggedInUser.getId();
    }

}
