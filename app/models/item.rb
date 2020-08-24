class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_price, format: { with:  }
    validates :deli_fee
    validates :condition
    validates :category
    validates :shipping_area
    validates :shipping_day
  end
end
