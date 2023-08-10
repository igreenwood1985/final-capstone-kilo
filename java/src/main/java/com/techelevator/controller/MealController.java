package com.techelevator.controller;

import com.techelevator.dao.MealDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.MealDTO;
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
public class MealController {

    private MealDao mealDao;
    private UserDao userDao;

    public MealController(MealDao mealDao, UserDao userDao) {
        this.mealDao = mealDao;
        this.userDao = userDao;
    }

    @RequestMapping(path = "/mymeals", method = RequestMethod.GET)
    public MealDTO[] retrieveAllMeals(Principal principal){
        MealDTO[] allMeals;
        int userID = userDao.getUserByUsername(principal.getName()).getId();
        List<MealDTO> allMealsList = mealDao.getAllMeals(userID);
        allMeals = allMealsList.toArray(new MealDTO[allMealsList.size()]);
        return allMeals;
    }
}
