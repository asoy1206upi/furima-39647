class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid" }
    validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "must be selected" }
    validates :city
    validates :address
    validates :phone_number, length: { minimum: 10, maximum: 11 }
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building: building, order_id: order.id)
  end
end