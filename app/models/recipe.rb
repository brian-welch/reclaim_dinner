class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  # has_many :user_recipes
  # has_many :recipe_ratings
  # has_many :category_recipes
end
