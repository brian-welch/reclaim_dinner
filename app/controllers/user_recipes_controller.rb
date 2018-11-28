class UserRecipesController < ApplicationController

  # def index
  #   if current_user.nil?
  #     @five_recipes = []
  #     5.times.with_index { @five_recipes << Recipe.all.sample }
  #     @five_recipes
  #   else
  #     @five_recipes = []
  #     5.times.with_index { @five_recipes << Recipe.all.sample }
  #     @five_recipes
  #   end
  # end

  def create
  end
  #   @recipe_list = []
  #   5.times.with_index { @recipe_ingredients << RecipeIngredient.where(recipe_id: params[:id]) }
  # #   @recipe_list.each....
    # redirect_to shopping_list_path

 # def set_user
 #    @user = current_user
 # end

 def set_date
  @chosen_date = Date.today.beginning_of_week
  @Monday = @chosen_date
  @Tuesday = @chosen_date + 1
  @Wednesday = @chosen_date + 2
  @Thursday = @chosen_date + 3
  @Friday = @chosen_date + 4
 end

end
