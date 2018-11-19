require 'json'
require 'open-uri'
require 'nokogiri'
require_relative 'methods/seed_methods'

## clears terminal window
system 'clear'

## adds arty farty title to terminal
puts '*' * 23
puts ' Seeding your database'
puts '*' * 23
puts '- ' * 30 + "\n"

start_working

# puts "\nDestroying the database....."
# sleep 1

# FoodPreference.destroy_all
# FoodPreferenceUser.destroy_all

# Allergy.destroy_all
# AllergyUser.destroy_all

# SpecialDiet.destroy_all
# SpecialDietUser.destroy_all

# Ingredient.destroy_all
# MetricMeasure.destroy_all
# ImperialMeasure.destroy_all
# RecipeComponent.destroy_all

# Category.destroy_all
# SubCategory.destroy_all
# SpicyLevel.destroy_all

# UserRecipe.destroy_all
# RecipeRating.destroy_all

# Recipe.destroy_all
# User.destroy_all

# puts " >> Entire database deleted!\n"
# puts '- ' * 30 + "\n\n"



all_ingredients_array = []
all_metric_measures_array = []
all_us_measures_array = []
all_recipe_categories_array = []



Dir.glob("db/json_files/*.json").each do |json_file|
  puts json_file

  recipe_file = JSON.parse(File.read("#{json_file}"))

  puts "\nProcessing #{json_file}....."
  sleep 0.1

  recipe_file['body']["recipes"].each do |recipe_array|
    recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
      unless all_ingredients_array.include?(ingredient_array["name"])
        all_ingredients_array << ingredient_array["name"]
      end
    end
  end

  recipe_file['body']["recipes"].each do |recipe_array|
    recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
      unless all_metric_measures_array.include?(ingredient_array["measures"]["metric"]["unitShort"])
        all_metric_measures_array << ingredient_array["measures"]["metric"]["unitShort"]
      end
    end
  end

  recipe_file['body']["recipes"].each do |recipe_array|
    recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
      unless all_us_measures_array.include?(ingredient_array["measures"]["us"]["unitShort"])
        all_us_measures_array << ingredient_array["measures"]["us"]["unitShort"]
      end
    end
  end

  recipe_file['body']["recipes"].each do |recipe_array|
    recipe_array["cuisines"].each_with_index do |cuisines, i|
      unless all_recipe_categories_array.include?(cuisines) || cuisines.size.zero?
        all_recipe_categories_array << cuisines
      end
    end
  end

end

puts "\n >> Number of ingredients created: #{all_ingredients_array.count}"
puts " >> Number of Metric Measures created: #{all_metric_measures_array.count}"
puts " >> Number of US Measures created: #{all_us_measures_array.count}"
puts " >> Number of Categories created: #{all_recipe_categories_array.count}"

# kills status message operation
start_working.exit
