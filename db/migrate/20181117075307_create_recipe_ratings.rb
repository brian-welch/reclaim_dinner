class CreateRecipeRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ratings do |t|
      t.string :title
      t.text :body
      t.integer :stars
      t.references :users, foreign_key: true
      t.references :recipes, foreign_key: true

      t.timestamps
    end
  end
end
