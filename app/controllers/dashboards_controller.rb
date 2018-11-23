class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :edit, :update ]
  before_action :set_user

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
end
