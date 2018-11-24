class AddFieldsToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :vegetarian, :boolean
    add_column :recipes, :vegan, :boolean
    add_column :recipes, :glutenFree, :boolean
    add_column :recipes, :dairyFree, :boolean
    add_column :recipes, :beef, :boolean
    add_column :recipes, :chicken, :boolean
    add_column :recipes, :pork, :boolean
    add_column :recipes, :fish, :boolean
    add_column :recipes, :shellfish, :boolean
    add_column :recipes, :ketogenic, :boolean
    add_column :recipes, :peanut, :boolean
    add_column :recipes, :tofu, :boolean
    add_column :recipes, :banana, :boolean
    add_column :recipes, :paleo, :boolean
    add_column :recipes, :primal, :boolean
    add_column :recipes, :egg, :boolean
  end
end
