class Order < ApplicationRecord
  belongs_to :item, optional: true
  has_one :address
end
