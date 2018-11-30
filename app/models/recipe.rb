class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :user_favorites, dependent: :destroy
  has_many :users, through: :user_favorites
  has_many :user_recipes, dependent: :destroy
  has_many :recipe_ratings, dependent: :destroy

  def list_of_icons
    options =[
     :vegetarian,
     :vegan,
     :glutenFree,
     :dairyFree,
     # :pork,
     # :fish,
     # :shellfish,
     # :peanut,
     # :tofu,
     # :egg
    ]
    options.select do |option|
      self.public_send(option)
    end.reject do |option|
      self.vegan && [:vegetarian, :dairyFree].include?(option)
    end.map do |result|
      result.to_s + '.svg'
    end
  end

end

# Goes sandwiched between the 'end' and'.map' on line 21 - goes right in the middle and .map follows this end in here
# .reject do |option|
#       self.vegan && [:vegetarian, :dairyFree].include? option
#     end
