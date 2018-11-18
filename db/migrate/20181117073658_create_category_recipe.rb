class CreateCategoryRecipe < ActiveRecord::Migration[5.2]
  def change
    create_table :category_recipes do |t|
      t.references :category, foreign_key: true
      t.references :recipe, foreign_key: true
    end
  end
end
