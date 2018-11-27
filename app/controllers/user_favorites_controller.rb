
class UserFavoritesController < ApplicationController
  before_action :set_user_favorites

  def create
    # byebug
    recipe = Recipe.find(params["recipe_id"].to_i)
    if params[:exist] == "true"
      UserFavorite.where(user: current_user, recipe: recipe).each(&:destroy)
    else
      UserFavorite.create!(user: current_user, recipe: recipe).save
    end
    redirect_to profile_path

  end

  def destroy
    # byebug
    UserFavorite.find(params["id"]).destroy
  end


  private

  def set_user_favorites
    @user_favorites = UserFavorite.where(user_id: current_user)
  end

end
