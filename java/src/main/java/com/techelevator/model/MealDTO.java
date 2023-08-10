package com.techelevator.model;

public class MealDTO {

    private int meal_id;
    private int user_id;
    private String name;
    private String description;

    private RecipeDto[] recipes;

    public int getMeal_id() {
        return meal_id;
    }

    public void setMeal_id(int meal_id) {
        this.meal_id = meal_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public RecipeDto[] getRecipes() {
        return recipes;
    }

    public void setRecipes(RecipeDto[] recipes) {
        this.recipes = recipes;
    }

    // Custom Methods

    public void addToRecipes(RecipeDto recipe){

        RecipeDto[] recipes;

        if(this.recipes != null) {

            recipes = new RecipeDto[this.recipes.length + 1];

            for (int counter = 0; this.recipes.length > counter; counter++) {
                recipes[counter] = this.recipes[counter];
            }

            recipes[this.recipes.length] = recipe;
        } else {
            recipes = new RecipeDto[1];
            recipes[0] = recipe;
        }

        this.recipes = recipes;
    }
}
