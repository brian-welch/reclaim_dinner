class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_recipe, only: [:show]

  def show
    @recipe_ingredients = Recipe.joins(:recipe_ingredients).where("recipe_ingredients.recipe_id = #{params[:id]}")
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
