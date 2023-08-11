package com.techelevator.controller;

import com.techelevator.dao.MealDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.MealDTO;
import com.techelevator.model.RecipeDto;
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

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addmeal", method = RequestMethod.POST)
    public MealDTO addMeal(@RequestBody MealDTO meal, Principal principal){
        int userID = getUserId(principal);
        meal = mealDao.createMeal(userID, meal);
        return meal;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/mymeals/{mealId}", method = RequestMethod.GET)
    public MealDTO getMealByID(@PathVariable int mealId, Principal principal) {
        int userID = getUserId(principal);
        MealDTO meal = mealDao.retrieveMealByID(userID, mealId);

        return meal;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addrecipetomeal/{mealId}", method = RequestMethod.POST)
    public void addRecipeToMeal(@PathVariable int mealId, @RequestBody RecipeDto recipeDto) {
        mealDao.addRecipeToMeal(recipeDto.getRecipe_id(), mealId);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/mealeditor/delete/{mealId}/{recipeId}", method = RequestMethod.DELETE)
    public void removeRecipeFromMeal(@PathVariable int mealId, @PathVariable int recipeId) {
        mealDao.removeRecipeFromMeal(recipeId, mealId);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/deletemeal/{mealId}", method = RequestMethod.DELETE)
    public void deleteMeal(@PathVariable int mealId) {
        mealDao.deleteMeal(mealId);
    }

    private int getUserId(Principal principal){
        return userDao.getUserByUsername(principal.getName()).getId();
    }
}
