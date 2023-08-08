package com.techelevator.controller;


import com.techelevator.dao.RecipeDao;
import com.techelevator.dao.UserDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.RecipeDto;
import com.techelevator.model.User;
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
    @RequestMapping(path = "/dashboard/recipes",method = RequestMethod.GET)
    public RecipeDto[] getDashboardRecipes(Principal principal) {
        List<RecipeDto> recipeDtoList =  recipeDao.getAllFavoritedRecipes(getLoggedInUserId(principal));
        return recipeDtoList.toArray(new RecipeDto[recipeDtoList.size()]);
    }

    // Gets ALL favorited recipes from logged in users
    @RequestMapping(path = "/myrecipes",method = RequestMethod.GET)
    public RecipeDto[] getAllFavoritedRecipes(Principal principal) {
        List<RecipeDto> recipeDtoList =  recipeDao.getAllFavoritedRecipes(getLoggedInUserId(principal));
        return recipeDtoList.toArray(new RecipeDto[recipeDtoList.size()]);
    }

    // Add recipe to favorites
    @RequestMapping(path = "/dashboard", method = RequestMethod.POST)
    public RecipeDto addFavoriteRecipe(@RequestBody RecipeDto recipeDto, Principal principal) {
       try {
           RecipeDto responseRecipeDto = recipeDao.addFavoriteRecipe(recipeDto, getLoggedInUserId(principal));
           return responseRecipeDto;
       } catch (DaoException e) {
           System.out.println(e.getMessage());
           return null;
       }
    }

    //
    private int getLoggedInUserId(Principal principal) {
        String username = principal.getName();
        User loggedInUser = userDao.getUserByUsername(username);
        return loggedInUser.getId();
    }

}
