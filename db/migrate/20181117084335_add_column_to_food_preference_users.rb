class AddColumnToFoodPreferenceUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :food_preference_users, :strength, :integer, default: 5
  end
end
