package com.techelevator.controller;


import com.techelevator.dao.RecipeDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.RecipeDto;
import com.techelevator.model.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
    @RequestMapping(path = "/dashboard",method = RequestMethod.GET)
    public RecipeDto[] getAllFavoritedRecipes(Principal principal){
        String username = principal.getName();
        User loggedInUser = userDao.getUserByUsername(username);
        int userId = loggedInUser.getId();
        List<RecipeDto> recipeDtoList =  recipeDao.getAllFavoritedRecipes(userId);
        return recipeDtoList.toArray(new RecipeDto[recipeDtoList.size()]);


    }



}
