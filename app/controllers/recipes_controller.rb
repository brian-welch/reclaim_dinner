require 'pry-byebug'
class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :shuffle ]
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

  def shuffle
    @five_new_recipes = Array.new(5) { Recipe.all.sample }
    days = %w[monday tuesday wednesday thursday friday]
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
    @recipe_ingredients = RecipeIngredient.where(recipe_id: params[:id])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_user_favorites
    @user_favorites = UserFavorite.where(user: current_user)
  end

end




    # model = "#{params[:model].tr('_','')}".constantize
    # join_model = "#{params[:model].tr('_','')}User".constantize
    # field_id = "#{params[:model].downcase}_id"

    # if params[:exist] == "true"
    #   join_model.where(user: current_user, field_id => model.find_by_name(params[:name]).id).each(&:destroy)
    # else
    #   join_model.create!(user: current_user, field_id => model.find_by_name(params[:name]).id).save
    # end
    # redirect_to profile_path
