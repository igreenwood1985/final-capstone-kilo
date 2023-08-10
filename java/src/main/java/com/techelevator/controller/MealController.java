package com.techelevator.controller;

import com.techelevator.dao.MealDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.MealDTO;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class MealController {

    private MealDao mealDao;
    private UserDao userDao;

    public MealController(MealDao mealDao, UserDao userDao) {
        this.mealDao = mealDao;
        this.userDao = userDao;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/mymeals", method = RequestMethod.GET)
    public MealDTO[] getAllMeals(Principal principal){
        MealDTO[] allMeals;
        int userID = userDao.getUserByUsername(principal.getName()).getId();
        List<MealDTO> allMealsList = mealDao.retrieveAllMeals(userID);
        allMeals = allMealsList.toArray(new MealDTO[allMealsList.size()]);
        return allMeals;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/dashboard/meals", method = RequestMethod.GET)
    public MealDTO[] getDashboardRecipes(Principal principal) {
        MealDTO[] dashboardMeals;
        int userID = userDao.getUserByUsername(principal.getName()).getId();
        List<MealDTO> allMealsList = mealDao.retrieveDashboardMeals(userID);
        dashboardMeals = allMealsList.toArray(new MealDTO[allMealsList.size()]);
        return dashboardMeals;
    }
}
