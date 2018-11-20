class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      # added the array designation to instuctions...ok to alter existing migration file?
      t.text :instructions, array: true, default: []
      t.string :photo_link
      t.integer :prep_time
      t.integer :cook_time
      t.integer :views, default: 0
      t.integer :saves, default: 0
      t.integer :servings

      t.timestamps
    end
  end
end
