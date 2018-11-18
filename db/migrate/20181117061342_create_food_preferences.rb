class CreateFoodPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :food_preferences do |t|
      t.string :name
      t.integer :strength

      t.timestamps
    end
  end
end
