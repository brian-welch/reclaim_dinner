class DropRecipeComponents < ActiveRecord::Migration[5.2]
  def change
    drop_table :recipe_components
  end
end
