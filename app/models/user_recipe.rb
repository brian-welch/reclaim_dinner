class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :chosen_date, uniqueness: { scope: :user }
end
