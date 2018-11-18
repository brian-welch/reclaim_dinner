class FoodPreferenceUser < ApplicationRecord
  belongs_to :food_preference
  belongs_to :user
end
