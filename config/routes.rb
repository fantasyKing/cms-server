Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  get 'pages/about', to: 'pages#about'
  scope '/admin' do
    resources :users
  end

  mount API => '/'
end
