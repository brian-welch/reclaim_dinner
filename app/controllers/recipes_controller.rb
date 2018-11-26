class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_recipe, only: [:show]

  def index
    if current_user.nil?
      @five_recipes = []
      5.times.with_index { @five_recipes << Recipe.all.sample }
      @five_recipes
    else
      @five_recipes = []
      5.times.with_index { @five_recipes << Recipe.all.sample }
      @five_recipes
    end

  end

  def create
      @five_recipes = []
      5.times.with_index { @five_recipes << Recipe.all.sample }
      @five_recipes
      redirect_to recipes_path
  end


  def show

    @recipe_ingredients = RecipeIngredient.where(recipe_id: params[:id])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
