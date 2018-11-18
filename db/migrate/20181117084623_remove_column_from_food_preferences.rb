class RemoveColumnFromFoodPreferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :food_preferences, :strength
  end
end
