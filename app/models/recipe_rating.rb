class RecipeRating < ApplicationRecord
  belongs_to :users
  belongs_to :recipes
end
