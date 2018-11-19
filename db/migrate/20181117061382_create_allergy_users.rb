class CreateAllergyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :allergy_users do |t|
      t.references :allergy, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
