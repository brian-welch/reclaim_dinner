class SpecialDietUser < ApplicationRecord
  belongs_to :special_diet
  belongs_to :user

  validates :user, uniqueness: { scope: :special_diet }


  def available_recipes
    self.where(user: current_user)
    # AllergyUser.where(user: User.first)
  end

end
