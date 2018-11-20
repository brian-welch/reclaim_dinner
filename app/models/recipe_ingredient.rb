class RecipeIngredient < ApplicationRecord
  belongs_to :ingredients
  belongs_to :imperial_measures
  belongs_to :metric_measures
  belongs_to :recipes
end
