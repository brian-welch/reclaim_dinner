class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.string :metric_quantity
      t.string :imperial_quantity
      t.references :ingredient, foreign_key: true
      t.references :imperial_measure, foreign_key: true
      t.references :metric_measure, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
