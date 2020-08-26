class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
    validates :item_price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end

  with_options numericality: { greater_than: 1, message: 'を選んでください' } do
    validates :deli_fee, presence: true
    validates :condition, presence: true
    validates :category, presence: true
    validates :shipping_area, presence: true
    validates :shipping_day, presence: true
  end
end
