Rails.application.routes.draw do
  get 'recipes/user_recipes'
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'

  resources :recipes, only: [:index, :show]
  resources :user_recipes, only: [:create, :edit, :update]



  get 'dashboard', to: 'dashboards#index', as: "dashboard"
  post 'dashboard', to: 'dashboards#create'

end
