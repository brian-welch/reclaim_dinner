class AddMoreFieldsToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :source_link, :string
    add_column :recipes, :whole30, :boolean
  end
end
