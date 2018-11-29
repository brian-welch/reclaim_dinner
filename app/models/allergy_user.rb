class AllergyUser < ApplicationRecord
  belongs_to :allergy
  belongs_to :user

end
