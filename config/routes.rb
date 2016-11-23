Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  get 'pages/about', to: 'pages#about'
  resources :users, only: [:show, :index]
end
