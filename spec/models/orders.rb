class Order < ApplicationRecord
  validates :price, presence: true
end
#Rails.application.routes.draw do
  #root to: 'orders#index'
  #resources :orders, only:[:create]
#end