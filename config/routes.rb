Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items # only: [:index, :new, :create, :show]
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  #root "articles#index"
end