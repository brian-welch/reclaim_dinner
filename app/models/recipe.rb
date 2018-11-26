class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :user_recipes
  has_many :recipe_ratings

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
    end.map do |result|
      result.to_s + '.svg'
    end
  end
end

# Goes sandwicehd between selevt and map starts line 21. this end followed by map.
# .reject do |option|
#       self.vegan && [:vegetarian, :dairyFree].include? option
#     end
