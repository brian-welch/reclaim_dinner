class CreateRecipeComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_components do |t|
      t.string :metric_quantity
      t.string :imperial_quantity
      t.references :ingredients, foreign_key: true
      t.references :imperial_measures, foreign_key: true
      t.references :metric_measures, foreign_key: true
      t.references :recipes, foreign_key: true

      t.timestamps
    end
  end
end
