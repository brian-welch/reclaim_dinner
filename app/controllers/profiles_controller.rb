class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, :set_preferences, :set_allergies, :set_diets, :set_user_preferences, :set_user_allergies, :set_user_diets

  def show
  end

  def edit
  end

  def update
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
    @user_preferences = current_user
  end

  def set_user_allergies
    @user_allergies = current_user
  end

  def set_user_diets
    @user_diets = current_user
  end

end
