class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :shuffle]
  before_action :set_recipe, :set_user_favorites, only: [:show]

  def index
    if current_user.nil?
      all_recipes = Recipe.all
      @five_recipes = Array.new(5) { all_recipes.sample }
    else
      current_user.reload
      filtered_recipes = current_user.apply_filters
      @five_recipes = Array.new(5) { filtered_recipes.sample }
    end
  end

  def shuffle
    if current_user.nil?
      all_recipes = Recipe.all
      @five_new_recipes = Array.new(5) { all_recipes.sample }
    else
      current_user.reload
      filtered_recipes = current_user.apply_filters
      @five_new_recipes = Array.new(5) { filtered_recipes.sample }
    end
    days = %w[Monday Tuesday Wednesday Thursday Friday]
    @recipes = {}
    days.each.with_index do |day, idx|
      @recipes[day] = @five_new_recipes[idx]
    end
  end

  def create
    @five_recipes = []
    5.times.with_index { @five_recipes << Recipe.all.sample }
    @five_recipes
    redirect_to recipes_path
  end

  def show
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_user_favorites
    @user_favorites = UserFavorite.where(user: current_user)
  end
end
