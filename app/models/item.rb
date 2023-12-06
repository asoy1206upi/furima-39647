class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :description, presence: true

  #validates :name, :price, :description, :category_id, :product_condition_id, :prefecture_id, presence: true
  #validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  #validates :name, presence: true
  #validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  #validates :description, presence: true
  #validates :content, presence: true

  #belongs_to :user
  #has_one :item_image
  #has_one_attached :image
end
