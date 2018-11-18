class CreateAlergies < ActiveRecord::Migration[5.2]
  def change
    create_table :alergies do |t|
      t.string :name

      t.timestamps
    end
  end
end
