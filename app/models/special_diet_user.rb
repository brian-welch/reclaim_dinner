class SpecialDietUser < ApplicationRecord
  belongs_to :special_diet
  belongs_to :user
end
