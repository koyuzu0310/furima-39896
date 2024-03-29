class OrderForm
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :item_id, :user_id, :postal_code, :item_prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :item_prefecture_id, presence: true, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end