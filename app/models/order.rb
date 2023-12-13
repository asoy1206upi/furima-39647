class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  validates :postal_code, :prefecture, :city, :address, :phone_number, presence: true
end
