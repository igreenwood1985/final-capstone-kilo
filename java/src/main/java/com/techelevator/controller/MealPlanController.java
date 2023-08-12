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
    @RequestMapping(path = "/mymealplans", method = RequestMethod.GET)
    public MealPlanDTO[] getAllMealPlans(Principal principal){
        int userId = getUserId(principal);
        List<MealPlanDTO> mealPlanList = mealPlanDAO.retrieveAllMealPlans(userId);
        MealPlanDTO[] mealPlans = mealPlanList.toArray(new MealPlanDTO[mealPlanList.size()]);

        return mealPlans;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/mymealplans/{mealId}")
    public MealPlanDTO getMealPlanByID(@PathVariable int mealId, Principal principal) {
        int userID = getUserId(principal);
        MealPlanDTO mealPlan = mealPlanDAO.retrieveMealPlanByID(mealId, userID);

        return mealPlan;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/mymealplans", method = RequestMethod.POST)
    public void addMealPlan(@RequestBody MealPlanDTO mealPlan, Principal principal) {
        int userID = getUserId(principal);
        mealPlanDAO.addMealPlan(mealPlan, userID);
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "mymealplans", method = RequestMethod.PUT)
    public void updateMealPlan(@RequestBody MealPlanDTO mealPlan) {
        mealPlanDAO.updateMealPlan(mealPlan);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "mymealplans/{mealPlanId}", method = RequestMethod.DELETE)
    public void deleteMealPlan(@PathVariable int mealPlanId) {
        mealPlanDAO.deleteMealPlan(mealPlanId);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "mymealplans/{mealPlanId}", method = RequestMethod.POST)
    public void addMealToMealPlan(@PathVariable int mealPlanId, @RequestBody MealDTO meal) {
        mealPlanDAO.addMealToMealPlan(mealPlanId, meal.getMeal_id());
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "mymealplans/{mealPlanId}", method = RequestMethod.DELETE)
    public void removeMealFromMealPlan(@PathVariable int mealPlanId, int mealID) {
        mealPlanDAO.removeMealFromMealPlan(mealPlanId, mealID);
    }

    private int getUserId(Principal principal){
        return userDao.getUserByUsername(principal.getName()).getId();
    }
}
