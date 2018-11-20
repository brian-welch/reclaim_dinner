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

Recipe.destroy_all
RecipeIngredient.destroy_all
CategoryRecipe.destroy_all

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

# UserRecipe.destroy_all
# RecipeRating.destroy_all

# User.destroy_all

# puts " >> Entire database deleted!\n"
# puts '- ' * 30 + "\n\n"

puts '- ' * 30 + "\n"

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
          CategoryRecipe.create!(recipe_id: Recipe.find_by_name(recipe_array["title"]).id,
                                 category_id: Category.find_by_name(category_name).id)
        end
      end

      # Creating RecipeIngredient join table - Maybe move this outside the recipe array iteration
      recipe_array["extendedIngredients"].each do |ingredient_array|


        RecipeIngredient.create!(recipe_id: Recipe.find_by_name(recipe_array["title"]).id,
                                 metric_quantity: ingredient_array["measures"]["metric"]["amount"],
                                 imperial_quantity: ingredient_array["measures"]["us"]["amount"],
                                 ingredients_id: Ingredient.find_by_name(ingredient_array["name"]).id,
                                 imperial_measures_id: ImperialMeasure.find_by_name(ingredient_array["measures"]["us"]["unitShort"]).id,
                                 metric_measures_id: MetricMeasure.find_by_name(ingredient_array["measures"]["metric"]["unitShort"]).id)
      end



    # This 'end' ends the unless condition which ignores recipes without incrememented instructions steps
    end

  # This 'end' ends the iteration of 100 recipes or one json file
  end



  ################# this crap will be removed when recipe seed testing is completed

  # recipe_file_array.each do |recipe_array|
  #   recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
  #     unless all_metric_measures_array.include?(ingredient_array["measures"]["metric"]["unitShort"])
  #       all_metric_measures_array << ingredient_array["measures"]["metric"]["unitShort"]
  #     end
  #   end
  # end

  # recipe_file_array.each do |recipe_array|
  #   recipe_array["extendedIngredients"].each_with_index do |ingredient_array, i|
  #     unless all_us_measures_array.include?(ingredient_array["measures"]["us"]["unitShort"])
  #       all_us_measures_array << ingredient_array["measures"]["us"]["unitShort"]
  #     end
  #   end
  # end

  # recipe_file_array.each do |recipe_array|
  #   recipe_array["cuisines"].each_with_index do |cuisines, i|
  #     unless all_recipe_categories_array.include?(cuisines) || cuisines.size.zero?
  #       all_recipe_categories_array << cuisines
  #     end
  #   end
  # end

  # recipe_file_array.each do |recipe_array|
  #     analyzedInstructions_array = []
  #     unless recipe_array["analyzedInstructions"].size.zero?
  #       recipe_array["analyzedInstructions"][0]["steps"].each do |step|
  #           analyzedInstructions_array << step["step"]
  #       end
  #     end
  #     single_recipe_array = []
  #     single_recipe_array << recipe_array["title"]
  #     single_recipe_array << analyzedInstructions_array
  #     single_recipe_array << recipe_array["image"]
  #     single_recipe_array << recipe_array["preparationMinutes"]
  #     single_recipe_array << recipe_array["cookingMinutes"]
  #     single_recipe_array << recipe_array["servings"]
  #     single_recipe_array << recipe_array["servings"]
  #     single_recipe_array << recipe_array["creditsText"]
  #     unless all_recipe_array_of_arrays.include?(single_recipe_array)
  #       all_recipe_array_of_arrays << single_recipe_array
  #     end

  ################# end of 'this crap will be removed when recipe seed testing is completed'


  end
# this 'end' ends the iteration through all json files in the directory
end





# puts "\n >> Number of Ingredients created: #{all_ingredients_array.count}"
# puts " >> Number of MetricMeasures created: #{all_metric_measures_array.count}"
# puts " >> Number of ImperialMeasures created: #{all_us_measures_array.count}"
# puts " >> Number of Categories created: #{all_recipe_categories_array.count}"
# puts " >> Number of Recipes created: #{all_recipe_array_of_arrays.count}"

puts "\nPopulating the database!!"
sleep 1


all_ingredients_array.each do |ingredient|
  Ingredient.create!(name: ingredient)
end
puts "\n#{Ingredient.count} Ingreients in the database!!"
sleep 1


all_metric_measures_array.each do |measure|
  MetricMeasure.create!(name: measure)
end
puts "\n#{MetricMeasure.count} Metric Measures in the database!!"
sleep 1


all_us_measures_array.each do |measure|
  ImperialMeasure.create!(name: measure)
end
puts "\n#{ImperialMeasure.count} Imperial Measures in the database!!"
sleep 1


all_recipe_categories_array.each do |category|
  Category.create!(name: category)
end
puts "\n#{Category.count} Categories in the database!!"
sleep 1




# kills goofy 'working' animation
start_working.exit
