class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :design]
  def home

  end

  def design
    @title = "Designing Reclaim Dinner"
  end


end
