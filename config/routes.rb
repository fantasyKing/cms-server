Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  get 'pages/about', to: 'pages#about'
  resources :users

  mount API => '/'
end
