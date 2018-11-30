class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :shuffle]
  before_action :set_recipe, :set_user_favorites, only: [:show]

  def index
    if current_user.nil?
      all_recipes = Recipe.all
      # @five_recipes = Array.new(5) { all_recipes.sample }
      @five_recipes = get_five_recipes(all_recipes)

    else
      current_user.reload
      filtered_recipes = current_user.apply_filters
      # @five_recipes = Array.new(5) { filtered_recipes.sample }
      @five_recipes = get_five_recipes(filtered_recipes)

    end
  end

  def shuffle
    if current_user.nil?
      all_recipes = Recipe.all
      # @five_new_recipes = Array.new(5) { all_recipes.sample }
      @five_new_recipes = get_five_recipes(all_recipes)

    else
      current_user.reload
      filtered_recipes = current_user.apply_filters
      # @five_new_recipes = Array.new(5) { apply_filters.sample }
      @five_new_recipes = get_five_recipes(filtered_recipes)

    end
    days = %w[Monday Tuesday Wednesday Thursday Friday]
    @recipes = {}
    days.each.with_index do |day, idx|
      @recipes[day] = @five_new_recipes[idx]
    end
  end

  # def create
  #   @five_recipes = []
  #   5.times.with_index { @five_recipes << Recipe.all.sample }
  #   @five_recipes
  #   redirect_to recipes_path
  # end

  def show
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  private

    def get_five_recipes(recipes)
      temp = recipes.shuffle
      recipe_array = []
      5.times { recipe_array << temp.pop }
      recipe_array
    end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_user_favorites
    @user_favorites = UserFavorite.where(user: current_user)
  end
end
