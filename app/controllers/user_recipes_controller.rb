class UserRecipesController < ApplicationController

  def create
    day = (Date.today + 7).beginning_of_week
    user_recipes = []
    # WIPES DB OF ALL USER RECIPES
    # DELETE AFTER TESTING IS DONE
    UserRecipe.destroy_all
    %w(monday_id tuesday_id wednesday_id thursday_id friday_id).each do |id|
      user_recipe = UserRecipe.new
      recipe      = Recipe.find(params[id])
      user_recipe.recipe = recipe
      user_recipe.user   = current_user
      user_recipe.chosen_date = day
      day += 1
      user_recipe.save
      user_recipes << user_recipe
    end

    redirect_to profile_path
  end

