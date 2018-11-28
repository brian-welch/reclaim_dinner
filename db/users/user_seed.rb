def users
  return [
    {
      first_name: "brian",
      last_name: "welch",
      email: "myself@brianwelch.se",
      password: "12345678",
      user_name: "B-Dubs",
      birthday: "10-12-1974",
      street_address: "Vimpelgatan 17 lgh. 103",
      city: "malmö",
      county: "skåne",
      state: "",
      post_code: "21114",
      country: "Sweden",
      facebook_username: "",
      instagram_username: "",
      pinterest_username: "",
      children: false,
      time_preference: 60,
    }, {
      first_name: "beltrán",
      last_name: "sainz de vicuña nowack",
      email: "gorthor@gmail.com",
      password: "12345678",
      user_name: "",
      birthday: "",
      street_address: "",
      city: "",
      county: "",
      state: "",
      post_code: "",
      country: "",
      facebook_username: "",
      instagram_username: "",
      pinterest_username: "",
      children: false,
      time_preference: 60,
    }, {
      first_name: "makena",
      last_name: "hawley",
      email: "makena.hawley@gmail.com",
      password: "12345678",
      user_name: "",
      birthday: "",
      street_address: "",
      city: "",
      county: "",
      state: "",
      post_code: "",
      country: "",
      facebook_username: "",
      instagram_username: "",
      pinterest_username: "",
      children: false,
      time_preference: 60,
    }
  ]
end

def food_preferences
  return %w[beef pork chicken fish tofu banana]
end

def food_allergies
  return %w[peanut gluten dairy shellfish egg]
end

def special_diets
  return %w[paleo primal vegetarian vegan ketogenic whole30]
end


def set_default_food_preferences
  User.all.each do |user|
    FoodPreference.all.each do |preference|
      FoodPreferenceUser.create!(user_id: user.id, food_preference_id: preference.id)
    end
  end
end







