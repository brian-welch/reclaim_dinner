# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2018_11_20_103218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allergy_users", force: :cascade do |t|
    t.bigint "allergy_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allergy_id"], name: "index_allergy_users_on_allergy_id"
    t.index ["user_id"], name: "index_allergy_users_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_recipes", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "recipe_id"
    t.index ["category_id"], name: "index_category_recipes_on_category_id"
    t.index ["recipe_id"], name: "index_category_recipes_on_recipe_id"
  end

  create_table "food_preference_users", force: :cascade do |t|
    t.bigint "food_preference_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "strength", default: 5
    t.index ["food_preference_id"], name: "index_food_preference_users_on_food_preference_id"
    t.index ["user_id"], name: "index_food_preference_users_on_user_id"
  end

  create_table "food_preferences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imperial_measures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "ingredient_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metric_measures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.string "metric_quantity"
    t.string "imperial_quantity"
    t.bigint "ingredients_id"
    t.bigint "imperial_measures_id"
    t.bigint "metric_measures_id"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imperial_measures_id"], name: "index_recipe_ingredients_on_imperial_measures_id"
    t.index ["ingredients_id"], name: "index_recipe_ingredients_on_ingredients_id"
    t.index ["metric_measures_id"], name: "index_recipe_ingredients_on_metric_measures_id"
    t.index ["recipes_id"], name: "index_recipe_ingredients_on_recipes_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.string "metric_quantity"
    t.string "imperial_quantity"
    t.bigint "ingredients_id"
    t.bigint "imperial_measures_id"
    t.bigint "metric_measures_id"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imperial_measures_id"], name: "index_recipe_ingredients_on_imperial_measures_id"
    t.index ["ingredients_id"], name: "index_recipe_ingredients_on_ingredients_id"
    t.index ["metric_measures_id"], name: "index_recipe_ingredients_on_metric_measures_id"
    t.index ["recipes_id"], name: "index_recipe_ingredients_on_recipes_id"
  end

  create_table "recipe_ratings", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "stars"
    t.bigint "users_id"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipes_id"], name: "index_recipe_ratings_on_recipes_id"
    t.index ["users_id"], name: "index_recipe_ratings_on_users_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "photo_link"
    t.integer "prep_time"
    t.integer "cook_time"
    t.integer "views", default: 0
    t.integer "saves", default: 0
    t.integer "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source"
    t.text "instructions", default: [], array: true

  end

  create_table "special_diet_users", force: :cascade do |t|
    t.bigint "special_diet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["special_diet_id"], name: "index_special_diet_users_on_special_diet_id"
    t.index ["user_id"], name: "index_special_diet_users_on_user_id"
  end

  create_table "special_diets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_recipes", force: :cascade do |t|
    t.date "chosen_date"
    t.bigint "users_id"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipes_id"], name: "index_user_recipes_on_recipes_id"
    t.index ["users_id"], name: "index_user_recipes_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.date "birthday"
    t.string "street_address"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "post_code"
    t.string "country"
    t.string "facebook_username"
    t.string "instagram_username"
    t.string "pinterest_username"
    t.boolean "children"
    t.integer "time_preference"
    t.bigint "food_preference_users_id"
    t.bigint "allergy_users_id"
    t.bigint "special_diet_users_id"
    t.index ["allergy_users_id"], name: "index_users_on_allergy_users_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["food_preference_users_id"], name: "index_users_on_food_preference_users_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["special_diet_users_id"], name: "index_users_on_special_diet_users_id"
  end

  add_foreign_key "allergy_users", "allergies"
  add_foreign_key "allergy_users", "users"
  add_foreign_key "category_recipes", "categories"
  add_foreign_key "category_recipes", "recipes"
  add_foreign_key "food_preference_users", "food_preferences"
  add_foreign_key "food_preference_users", "users"
  add_foreign_key "recipe_ingredients", "imperial_measures", column: "imperial_measures_id"
  add_foreign_key "recipe_ingredients", "ingredients", column: "ingredients_id"
  add_foreign_key "recipe_ingredients", "metric_measures", column: "metric_measures_id"
  add_foreign_key "recipe_ingredients", "recipes", column: "recipes_id"
  add_foreign_key "recipe_ratings", "recipes", column: "recipes_id"
  add_foreign_key "recipe_ratings", "users", column: "users_id"
  add_foreign_key "special_diet_users", "special_diets"
  add_foreign_key "special_diet_users", "users"
  add_foreign_key "user_recipes", "recipes", column: "recipes_id"
  add_foreign_key "user_recipes", "users", column: "users_id"
  add_foreign_key "users", "allergy_users", column: "allergy_users_id"
  add_foreign_key "users", "food_preference_users", column: "food_preference_users_id"
  add_foreign_key "users", "special_diet_users", column: "special_diet_users_id"
end
