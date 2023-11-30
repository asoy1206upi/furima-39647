Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root 'items#index'
  resources :users, only: [:edit, :]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end