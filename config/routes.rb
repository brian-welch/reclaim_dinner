Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'

  resources :recipes, only: [:index, :show, :create]
  resources :user_recipes, only: [:create, :edit, :update]

  get 'profile', to: 'profiles#index', as: 'profile'
  post 'profile', to: 'profiles#update'

  get 'dashboard', to: 'dashboards#index', as: 'dashboard'
  post 'dashboard', to: 'dashboards#update'

end
