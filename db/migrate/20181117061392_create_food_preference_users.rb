class CreateFoodPreferenceUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :food_preference_users do |t|
      t.references :food_preference, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
