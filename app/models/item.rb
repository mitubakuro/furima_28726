class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
    validates :item_price, numericality: { greater_than: 299, less_than: 10_000_000 }
    validates :deli_fee, numericality: { greater_than: 1 , message: "（配送料）を選んでください"}
    validates :condition, numericality: { greater_than: 1 , message: "（商品の状態）を選んでください"}
    validates :category, numericality: { greater_than: 1 , message: "（カテゴリー）を選んでください"}
    validates :shipping_area, numericality: { greater_than: 1 , message: "（配送元の地域）を選んでください"}
    validates :shipping_day, numericality: { greater_than: 1 , message: "（発送までの日数）を選んでください"}
  end
end
