class CreateSpecialDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :special_diets do |t|
      t.string :name

      t.timestamps
    end
  end
end
