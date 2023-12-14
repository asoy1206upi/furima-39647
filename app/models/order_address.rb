class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid" }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, length: { minimum: 11 }
  end
end