class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, :description, :category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
end
