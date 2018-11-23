require 'json'
require 'open-uri'
require 'nokogiri'
require_relative 'users/user_seed'
require_relative 'methods/seed_methods'

## clears terminal window
system 'clear'

## adds arty farty title to terminal
puts '*' * 23
puts ' Seeding your database'
puts '*' * 23
puts '- ' * 30 + "\n"

# starts goofy 'working' animation
start_working

puts "\nDestroying the database!!"
sleep 3

Recipe.destroy_all
RecipeIngredient.destroy_all
CategoryRecipe.destroy_all

Ingredient.destroy_all
MetricMeasure.destroy_all
ImperialMeasure.destroy_all
Category.destroy_all


# FoodPreference.destroy_all
# FoodPreferenceUser.destroy_all

# Allergy.destroy_all
# AllergyUser.destroy_all

# SpecialDiet.destroy_all
# SpecialDietUser.destroy_all

# UserRecipe.destroy_all
# RecipeRating.destroy_all

# User.destroy_all

# puts " >> Entire database deleted!\n"
# puts '- ' * 30 + "\n\n"


puts "\nDatabase destroyed."
puts '- ' * 30 + "\n"
sleep 2


puts "\nPreparing to populate the database....."
sleep 1


# http://brianwelch.se/media/

# url = 'https://api.github.com/users/ssaunier'
# user_serialized = open(url).read
# user = JSON.parse(user_serialized)


# Iterates through every file in json_files directory
Dir.glob("http://brianwelch.se/media/json_files/*.json").each do |json_file|

  recipe_file = JSON.parse(File.read("#{json_file}"))
  recipe_file_array = recipe_file['body']["recipes"]

  puts "\n\nProcessing recipe #{json_file}\n"
  recipe_file_array.each do |recipe_array|
    # Will NOT add recipes whose recipe steps aren't incremented
    unless recipe_array["analyzedInstructions"].size.zero?

      # Creating Ingredient, MetricMeasure & ImperialMeasure Instances
      recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|

        # Will NOT create duplicate Ingredient Instances
        unless !Ingredient.find_by_name(ingredient_array["name"]).nil?
          Ingredient.create!(name: ingredient_array["name"])
        end

        # Will NOT create duplicate MetricMeasure Instances
        unless !MetricMeasure.find_by_name(ingredient_array["measures"]["metric"]["unitShort"]).nil?
          MetricMeasure.create!(name: ingredient_array["measures"]["metric"]["unitShort"])
        end

        # Will NOT create duplicate ImperialMeasure Instances
        unless !ImperialMeasure.find_by_name(ingredient_array["measures"]["us"]["unitShort"]).nil?
          ImperialMeasure.create!(name: ingredient_array["measures"]["us"]["unitShort"])
        end
      end

      # Creating Category Instances
      recipe_array["cuisines"].each_with_index do |cuisines, i|
        unless !Category.find_by_name(cuisines).nil?  || cuisines.size.zero?
          Category.create!(name: cuisines)
        end
      end

      # Creating Recipe Instances - a big one
      # Start by creating instructions array
      analyzedInstructions_array = []
      unless recipe_array["analyzedInstructions"].size.zero?
        recipe_array["analyzedInstructions"][0]["steps"].each do |step|
            analyzedInstructions_array << step["step"]
        end
      end
      # NOW instanting Recipe model
      unless !Recipe.find_by_name(recipe_array["title"]).nil?
        Recipe.create!(name: recipe_array["title"],
                       instructions: analyzedInstructions_array,
                       photo_link: recipe_array["image"],
                       prep_time: recipe_array["preparationMinutes"],
                       cook_time: recipe_array["cookingMinutes"],
                       servings: recipe_array["servings"],
                       source: recipe_array["creditsText"])
      end

      # Creating RecipeCategory join table - Maybe move this outside the recipe array iteration
      # Skip recipes which don't have any categories
      unless !recipe_array["cuisines"].size.zero?
        recipe_array["cuisines"].each do |category_name|
          CategoryRecipe.create!(recipe: Recipe.find_by_name(recipe_array["title"]),
                                 category: Category.find_by_name(category_name))
        end
      end

      # Creating RecipeIngredient join table - Maybe move this outside the recipe array iteration
      recipe_array["extendedIngredients"].each do |ingredient_array|


        RecipeIngredient.create!(recipe: Recipe.find_by_name(recipe_array["title"]),
                                 metric_quantity: ingredient_array["measures"]["metric"]["amount"],
                                 imperial_quantity: ingredient_array["measures"]["us"]["amount"],
                                 ingredient: Ingredient.find_by_name(ingredient_array["name"]),
                                 imperial_measure: ImperialMeasure.find_by_name(ingredient_array["measures"]["us"]["unitShort"]),
                                 metric_measure: MetricMeasure.find_by_name(ingredient_array["measures"]["metric"]["unitShort"]))
      end

    # This 'end' ends the unless condition which ignores recipes withousers.each do |user|
  User.create!(
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: user[:email],
    password: user[:password],
    user_name: user[:user_name],
    birthday: user[:birthday],
    street_address: user[:street_address],
    city: user[:city],
    county: user[:county],
    state: user[:state],
    post_code: user[:post_code],
    country: user[:country],
    facebook_username: user[:facebook_username],
    instagram_username: user[:instagram_username],
    pinterest_username: user[:pinterest_username],
    children: false,
    time_preference: 60
    )
end

puts "\nUsers Created!"


puts "\nCreating food preferences"
sleep 2
food_preferences.each do |preference|
  FoodPreference.create!(name: preference)
end
puts "\nPreferences Created!"


puts "\nCreating food allergies"
sleep 2
food_allergies.each do |allergy|
  Allergy.create!(name: allergy)
end
puts "\nAllergies Created!"


puts "\nCreating special diets"
sleep 2
special_diets.each do |diet|
  SpecialDiet.create!(name: diet)
end
puts "\nAllergies Created!"


# kills goofy 'working' animation
start_working.exit
