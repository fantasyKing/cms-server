Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'
  mount API => '/'

  get 'pages/about', to: 'pages#about'
  scope '/admin' do
    resources :users
  end
  # 数据库操作路有命命方式: /dashboard/db_name/collection_name
  scope '/dashboard' do
    namespace :db_user do
      resources :user_configs
      resources :users
    end
    namespace :db_app do
      resources :app_infos
    end
  end
  scope '/test' do
    resources :tests
  end
end
