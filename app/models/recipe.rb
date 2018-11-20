class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :user_recipes
  has_many :recipe_ratings

  belongs_to :categories
  belongs_to :sub_categories
  belongs_to :spicy_levels
end
