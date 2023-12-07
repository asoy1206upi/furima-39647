class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  #validates :name, :price, :description, :category_id, :product_condition_id, :prefecture_id, presence: true
  #validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  #validates :name, presence: true
  #validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  #validates :description, presence: true
  #validates :content, presence: true
  
end
