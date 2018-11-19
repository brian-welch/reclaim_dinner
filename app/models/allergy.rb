class Allergy < ApplicationRecord
  has_many :allergy_users, dependent: :destroy
  has_many :users, through: :allergy_users
end
