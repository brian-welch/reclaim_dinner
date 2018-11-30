require 'json'
require 'open-uri'
require 'nokogiri'
require_relative 'users/user_seed.rb'
require_relative 'recipe_checker/checker.rb'

emoji_array = %w[🍏 🍎 🍐 🍊 🍋 🍌 🍉 🍇 🍓 🍈 🍒 🍑 🍍 🥭 🥥 🥝 🍅 🍆 🥑 🥦 🥒 🥬 🌽 🥕 🥔 🍠 🥐 🍞 🥖 🥨 🥯 🧀 🥚 🍳 🥞 🥓 🥩 🍗 🍖 🌭 🍔 🍟 🍕 🥪 🥙 🌮]

wave = Enumerator.new do |e|
  loop do
    e.yield "    #{emoji_array[(rand(0..emoji_array.size))]} Working: "
  end
end
progress = Thread.new do
  loop do
    printf("\r%s", wave.next)
    sleep(0.3)
  end
end

## clears terminal window
system 'clear'

## adds arty farty title to terminal
puts '*' * 23
puts ' Seeding your database'
puts '*' * 23
puts '- ' * 30 + "\n"

# starts goofy 'working' animation



puts "\nDestroying the database!!"
sleep 2


Recipe.destroy_all
RecipeIngredient.destroy_all
CategoryRecipe.destroy_all

Ingredient.destroy_all
MetricMeasure.destroy_all
ImperialMeasure.destroy_all
Category.destroy_all

User.destroy_all

FoodPreferenceUser.destroy_all
AllergyUser.destroy_all
SpecialDietUser.destroy_all
FoodPreference.destroy_all
Allergy.destroy_all
SpecialDiet.destroy_all

UserRecipe.destroy_all
RecipeRating.destroy_all


puts "\nDatabase destroyed."
puts '- ' * 30 + "\n"



# http://brianwelch.se/media/json_files/recipe_remote_02.json

puts "\nOpening remote JSON file....."
# recipe_file = JSON.parse(File.read("db/bulk_gross_recipe_json.json"))
recipe_file = JSON.parse(open("http://brianwelch.se/media/json_files/recipe_seed_data_280.json").read)
recipe_file_array = recipe_file['body']["recipes"]

progress.kill

index = 1
recipe_file_array.each_with_index do |recipe_array, i|

  printf("\r    Processing recipe: %d of 778", index)


  # Will NOT add recipes whose recipe steps aren't incremented
  unless !go_no_go(recipe_array)
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
                     photo_link: recipe_array["image"],
                     prep_time: recipe_array["preparationMinutes"],
                     cook_time: recipe_array["cookingMinutes"],
                     servings: recipe_array["servings"],
                     source: recipe_array["creditsText"],
                     source_link: recipe_array["sourceUrl"],
                     instructions: analyzedInstructions_array,
                     vegetarian: recipe_array["vegetarian"],
                     vegan: recipe_array["vegan"],
                     glutenFree: recipe_array["glutenFree"],
                     dairyFree: recipe_array["dairyFree"],
                     gluten: !recipe_array["glutenFree"],
                     dairy: !recipe_array["dairyFree"],
                     ketogenic: recipe_array["ketogenic"],
                     paleo: recipe_array["paleo"],
                     primal: recipe_array["primal"],
                     whole30: recipe_array["whole30"],
                     beef: !check_recipe_parameter(recipe_array["extendedIngredients"], "beef").nil?,
                     chicken: !check_recipe_parameter(recipe_array["extendedIngredients"], "chicken").nil?,
                     pork: check_pork_parameter(recipe_array["extendedIngredients"]),
                     fish: !check_recipe_parameter(recipe_array["extendedIngredients"], "fish").nil?,
                     tofu: !check_recipe_parameter(recipe_array["extendedIngredients"], "tofu").nil?,
                     banana: !check_recipe_parameter(recipe_array["extendedIngredients"], "banana").nil?,
                     peanut: !check_recipe_parameter(recipe_array["extendedIngredients"], "peanut").nil?,
                     shellfish: check_shellfish_parameter(recipe_array["extendedIngredients"]),
                     egg: !check_recipe_parameter(recipe_array["extendedIngredients"], "egg").nil?,
                     )
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
                               metric_quantity: ingredient_array["measures"]["metric"]["amount"].class == Integer ? ingredient_array["measures"]["metric"]["amount"].ceil : ingredient_array["measures"]["metric"]["amount"],
                               imperial_quantity: ingredient_array["measures"]["us"]["amount"].class == Integer ? ingredient_array["measures"]["us"]["amount"].ceil : ingredient_array["measures"]["us"]["amount"],
                               ingredient: Ingredient.find_by_name(ingredient_array["name"]),
                               imperial_measure: ImperialMeasure.find_by_name(ingredient_array["measures"]["us"]["unitShort"]),
                               metric_measure: MetricMeasure.find_by_name(ingredient_array["measures"]["metric"]["unitShort"]))
    end

  # This 'end' ends the unless condition which ignores recipes without incrememented instructions steps
  end

  index += 1

# This 'end' ends the iteration of 100 recipes or one json file
end



puts "\nRecipes created."
sleep 2

puts "\nCreating users"
sleep 2

users.each do |user|
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
puts "\nSpecial Diets Created!\n"


puts "\nCreating Food Preference Defaults"
sleep 2
set_default_food_preferences
puts "\nFood Preference Defaults Created!\n"


puts '- ' * 30 + "\n"
puts '*' * 23
puts ' Seeding Completed'
puts '*' * 23


