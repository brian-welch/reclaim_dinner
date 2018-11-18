class AlergyUser < ApplicationRecord
  belongs_to :alergy
  belongs_to :user
end
