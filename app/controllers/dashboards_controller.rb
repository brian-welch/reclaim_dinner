class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :update]
  before_action :set_user, :set_preferences, :set_allergies, :set_diets, :set_user_preferences, :set_user_allergies, :set_user_diets

  def index
    @favorites_table = UserFavorite.where(user: current_user)
    @schedule_table = UserRecipe.where(user: current_user)
  end

  def update
    model = "#{params[:model].tr('_','')}".constantize
    join_model = "#{params[:model].tr('_','')}User".constantize
    field_id = "#{params[:model].downcase}_id"

    if params[:exist] == "true"
      join_model.where(user: current_user, field_id => model.find_by_name(params[:name]).id).each(&:destroy)
    else
      join_model.create!(user: current_user, field_id => model.find_by_name(params[:name]).id).save
    end
    redirect_to profile_path
  end

  def tabs
    tab = params[:tab]
    if tab == "favorites_table"
      @tabData = current_user.user_favorites
      @tab = tab
    elsif tab == "schedule_table"
      @tabData = current_user.user_recipes
      @tab = tab
    end
  end


  private


  def set_user
    @user = current_user
  end

  def set_preferences
    @all_preferences = FoodPreference.all
  end

  def set_allergies
    @all_allergies = Allergy.all
  end

  def set_diets
    @all_diets = SpecialDiet.all
  end

  def set_user_preferences
    @user_preferences = FoodPreferenceUser.where(user_id: current_user)
  end

  def set_user_allergies
    @user_allergies = AllergyUser.where(user_id: current_user)
  end

  def set_user_diets
    @user_diets = SpecialDietUser.where(user_id: current_user)
  end




end
