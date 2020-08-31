class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :city, :addresses, :build_number, :tel, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\d{3}-\d{4}/ }
    validates :shipping_area_id
    validates :city
    validates :addresses
    validates :tel, format: { with: /0\d{10}/ }
  end

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Address.create!(postal_code: postal_code, shipping_area_id: shipping_area_id,
                    city: city, addresses: addresses, build_number: build_number, tel: tel, order_id: order.id)
  end
end
