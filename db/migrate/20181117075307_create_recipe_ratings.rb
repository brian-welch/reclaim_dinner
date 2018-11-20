class CreateRecipeRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ratings do |t|
      t.string :title
      t.text :body
      t.integer :stars
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
