class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id

  with_options presence: true do
    validates :user_id
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item: item, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, order_id: order.id)
  end
end