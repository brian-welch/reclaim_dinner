class AddInstructionsColumnToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :instructions, :text, array: true, default: []
  end
end
