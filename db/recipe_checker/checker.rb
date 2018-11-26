
def go_no_go(recipe_array)
  approved_dishtypes = ["salad", "main dish", "main course", "dinner", "lunch", "appetizer"]
  if recipe_array["analyzedInstructions"].size.zero?
    return false
  elsif recipe_array["preparationMinutes"].nil?
    return false
  elsif recipe_array["preparationMinutes"].zero?
    return false
  elsif recipe_array["cookingMinutes"].nil?
    return false
  elsif recipe_array["cookingMinutes"].zero?
    return false
  elsif !recipe_array["dishTypes"].any? { |element| approved_dishtypes.include?(element) }
    return false
  else
    return true
  end
end

def check_recipe_parameter(ingredients_array, variable)
  ingredients_array.find do |ingredient|
    ingredient["name"].include?(variable)
  end
end

def check_shellfish_parameter(ingredients_array)
  shellfish = ["clams", "lobster", "mussels", "scallops", "prawns", "shrimp", "crab"]
  ingredients_array.any? { |ingredient|  shellfish.include?(ingredient["name"]) }
end

def check_pork_parameter(ingredients_array)
  pork = ["ham", "pork", "ribs"]
  ingredients_array.any? { |ingredient|  pork.include?(ingredient["name"]) }
end






