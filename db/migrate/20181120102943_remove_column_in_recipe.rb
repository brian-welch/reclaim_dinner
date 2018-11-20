class RemoveColumnInRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :instructions
  end
end
