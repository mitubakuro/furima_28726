class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :deli_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

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
    validates :deli_fee_id, presence: true
    validates :condition_id, presence: true
    validates :category_id, presence: true
    validates :shipping_area_id, presence: true
    validates :shipping_day_id, presence: true
  end
end
