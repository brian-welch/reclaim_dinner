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

# starts goofy 'working' animation
start_working

puts "\nDestroying the database!!"
sleep 1

Ingredient.destroy_all
MetricMeasure.destroy_all
ImperialMeasure.destroy_all
Category.destroy_all

puts "\nDatabase destroyed."
sleep 1

# FoodPreference.destroy_all
# FoodPreferenceUser.destroy_all

# Allergy.destroy_all
# AllergyUser.destroy_all

# SpecialDiet.destroy_all
# SpecialDietUser.destroy_all
# RecipeComponent.destroy_all

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
all_recipe_array_of_arrays = []


puts "\nPreparing to populate the database....."
sleep 1

# Iterates through every file in json_files directory
Dir.glob("db/json_files/*.json").each do |json_file|

  recipe_file = JSON.parse(File.read("#{json_file}"))
  recipe_file_array = recipe_file['body']["recipes"]


  recipe_file_array.each do |recipe_array|
    recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
      unless all_ingredients_array.include?(ingredient_array["name"])
        all_ingredients_array << ingredient_array["name"]
      end
    end
  end

  recipe_file_array.each do |recipe_array|
    recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
      unless all_metric_measures_array.include?(ingredient_array["measures"]["metric"]["unitShort"])
        all_metric_measures_array << ingredient_array["measures"]["metric"]["unitShort"]
      end
    end
  end

  recipe_file_array.each do |recipe_array|
    recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
      unless all_us_measures_array.include?(ingredient_array["measures"]["us"]["unitShort"])
        all_us_measures_array << ingredient_array["measures"]["us"]["unitShort"]
      end
    end
  end

  recipe_file_array.each do |recipe_array|
    recipe_array["cuisines"].each_with_index do |cuisines, i|
      unless all_recipe_categories_array.include?(cuisines) || cuisines.size.zero?
        all_recipe_categories_array << cuisines
      end
    end
  end

  recipe_file_array.each do |recipe_array|
      analyzedInstructions_array = []
      unless recipe_array["analyzedInstructions"].size.zero?
        recipe_array["analyzedInstructions"][0]["steps"].each do |step|
            analyzedInstructions_array << step["step"]
        end
      end
      single_recipe_array = []
      single_recipe_array << recipe_array["title"]
      single_recipe_array << analyzedInstructions_array
      single_recipe_array << recipe_array["image"]
      single_recipe_array << recipe_array["preparationMinutes"]
      single_recipe_array << recipe_array["cookingMinutes"]
      single_recipe_array << recipe_array["servings"]
      single_recipe_array << recipe_array["servings"]
      single_recipe_array << recipe_array["creditsText"]
      unless all_recipe_array_of_arrays.include?(single_recipe_array)
        all_recipe_array_of_arrays << single_recipe_array
      end
  end


end

puts "\n >> Number of Ingredients created: #{all_ingredients_array.count}"
puts " >> Number of MetricMeasures created: #{all_metric_measures_array.count}"
puts " >> Number of ImperialMeasures created: #{all_us_measures_array.count}"
puts " >> Number of Categories created: #{all_recipe_categories_array.count}"
puts " >> Number of Recipes created: #{all_recipe_array_of_arrays.count}"

puts "\nPopulating the database!!"
sleep 1

all_ingredients_array.each do |ingredient|
  Ingredient.create!(name: ingredient)
end
all_metric_measures_array.each do |measure|
  MetricMeasure.create!(name: measure)
end
all_us_measures_array.each do |measure|
  ImperialMeasure.create!(name: measure)
end
all_recipe_categories_array.each do |category|
  Category.create!(name: category)
end





# kills goofy 'working' animation
start_working.exit
