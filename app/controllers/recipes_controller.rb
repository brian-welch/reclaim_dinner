class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_recipe, only: [:show]

  def index
    @seven_recipes = []
    7.times { @seven_recipes << Recipe.all[rand(0..Recipe.count)] }
    @seven_recipes
  end

  def show
    @recipe_ingredients = Recipe.joins(:recipe_ingredients).where("recipe_ingredients.recipe_id = #{params[:id]}")
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
