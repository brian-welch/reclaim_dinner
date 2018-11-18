class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_recipes
  has_many :recipe_ratings
  has_many :recipes, through: :user_recipes

  has_many :food_preference_users, dependent: :destroy
  has_many :alergy_users, dependent: :destroy
  has_many :special_diet_users, dependent: :destroy

end
