class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_recipes, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :recipe_ratings, dependent: :destroy
  has_many :recipes, through: :user_recipes

  has_many :food_preference_users, dependent: :destroy
  has_many :food_preferences, through: :food_preference_users
  has_many :allergy_users, dependent: :destroy
  has_many :allergies, through: :allergy_users
  has_many :special_diet_users, dependent: :destroy
  has_many :special_diets, through: :special_diet_users

  def apply_filters
    if filters_hash.empty?
      return Recipe.all
    else
      return Recipe.where(filters_hash)
    end
  end

  # private

  def filters_hash
    allergy_hash.merge(diet_hash) # .merge(preference_hash)
    # byebug
  end

  def allergy_hash
    black_list = {}
    allergies.each { |allergy| black_list[allergy.name.to_sym] = false }
    return black_list
  end

  def diet_hash
    # byebug
    black_list = {}
    special_diets.each { |diet| black_list[diet.name.to_sym] = true }
    return black_list
  end

  def preference_hash
    black_list = {}
    food_preferences.each { |preference| black_list[preference.name.to_sym] = false }
    return black_list
  end

end
