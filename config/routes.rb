Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
  resources :user
  resources :orders, only: [:index]
  root to: 'orders#index'
  resources :orders, only:[:create]
  end
end