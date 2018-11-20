class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :imperial_measure
  belongs_to :metric_measure
  belongs_to :recipe
end
