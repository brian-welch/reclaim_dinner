class CreateSpecialDietUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :special_diet_users do |t|
      t.references :special_diet, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
