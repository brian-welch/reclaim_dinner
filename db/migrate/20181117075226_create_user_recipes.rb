class CreateUserRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_recipes do |t|
      t.date :chosen_date
      t.references :users, foreign_key: true
      t.references :recipes, foreign_key: true

      t.timestamps
    end
  end
end
