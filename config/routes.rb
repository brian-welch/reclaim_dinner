Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'

  resources :recipes, only: [:index, :show, :update]
  resources :user_recipes, only: [:create, :edit, :update]

  resources 'user_favorites', only: [:create, :destroy]

  get 'shuffle-recipes', to: 'recipes#shuffle', as: 'shuffle'


  get 'profile', to: 'profiles#index', as: 'profile'
  post 'profile', to: 'profiles#update'
  delete 'profile', to: 'profile#destroy'

  get 'dashboard', to: 'dashboards#index', as: 'dashboard'
  post 'dashboard', to: 'dashboards#update'
  patch 'dashboard', to: 'dashboards#tabs'

  resources 'user_recipes', only: [:index, :create, :update]

  get 'shopping_list', to: 'user_recipes#shopping_list', as: 'shopping_list'


end
