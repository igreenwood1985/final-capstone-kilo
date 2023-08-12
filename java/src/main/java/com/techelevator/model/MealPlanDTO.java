package com.techelevator.model;

public class MealPlanDTO {
    private String mealPlanName;
    private String description;
    private int userId;
    private int mealPlanId;

    private MealDTO[] meals;

    public String getMealPlanName() {
        return mealPlanName;
    }

    public void setMealPlanName(String mealPlanName) {
        this.mealPlanName = mealPlanName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMealPlanId() {
        return mealPlanId;
    }

    public void setMealPlanId(int mealPlanId) {
        this.mealPlanId = mealPlanId;
    }

    public MealDTO[] getMeals() {
        return meals;
    }

    public void setMeals(MealDTO[] meals) {
        this.meals = meals;
    }

    // Beginning of user-defined methods

    public void addToMeals(MealDTO meal){

        MealDTO[] meals;

        if(this.meals != null) {

            meals = new MealDTO[this.meals.length + 1];

            for (int counter = 0; this.meals.length > counter; counter++) {
                meals[counter] = this.meals[counter];
            }

            meals[this.meals.length] = meal;
        } else {
            meals = new MealDTO[1];
            meals[0] = meal;
        }

        this.meals = meals;
    }
}
