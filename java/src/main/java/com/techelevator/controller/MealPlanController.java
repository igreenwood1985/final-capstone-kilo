package com.techelevator.controller;


import com.techelevator.dao.MealPlanDAO;
import com.techelevator.dao.UserDao;
import com.techelevator.model.MealDTO;
import com.techelevator.model.MealPlanDTO;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class MealPlanController {

    private UserDao userDao;
    private MealPlanDAO mealPlanDAO;

    public MealPlanController(UserDao userDao, MealPlanDAO mealPlanDAO){
        this.userDao = userDao;
        this.mealPlanDAO = mealPlanDAO;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path= "/mymealplans", method = RequestMethod.GET)
    public MealPlanDTO[] getAllMealPlans(Principal principal){
        int userId = getUserId(principal);
        List<MealPlanDTO> mealPlanList = mealPlanDAO.retrieveAllMeals(userId);
        MealPlanDTO[] mealPlans = mealPlanList.toArray(new MealPlanDTO[mealPlanList.size()]);

        return mealPlans;
    }

    private int getUserId(Principal principal){
        return userDao.getUserByUsername(principal.getName()).getId();
    }
}
