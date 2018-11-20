class CreateCategoryRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_recipes do |t|

      t.timestamps
    end
  end
end
