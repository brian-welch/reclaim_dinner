class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_recipe, only: [:show]

  def show
    @recipe = Recipe.find(params[:id])
  end
end
