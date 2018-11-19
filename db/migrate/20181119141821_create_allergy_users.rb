class CreateAllergyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :allergy_users do |t|

      t.timestamps
    end
  end
end
