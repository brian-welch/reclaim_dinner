class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :birthday, :date
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :county, :string
    add_column :users, :state, :string
    add_column :users, :post_code, :string
    add_column :users, :country, :string
    add_column :users, :facebook_username, :string
    add_column :users, :instagram_username, :string
    add_column :users, :pinterest_username, :string
    add_column :users, :children, :boolean
    add_column :users, :time_preference, :integer
    add_reference :users, :food_preference_user, foreign_key: true
    add_reference :users, :allergy_user, foreign_key: true
    add_reference :users, :special_diet_user, foreign_key: true
  end
end
