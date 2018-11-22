Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'

  resources :recipes, only: [:index, :show]
  resources :user_recipes, only: [:create, :edit, :update]
  resources :dashboards, only: [:show, :edit, :update]
  resources :profiles, only: [:show, :edit, :update]

end
