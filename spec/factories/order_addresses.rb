FactoryBot.define do
  factory :order_address do
    postal_code { '812-0011' }
    shipping_area_id { 40 }
    city { '福岡市博多区' }
    addresses { '博多駅前1丁目21-20' }
    tel { '09012345678' }
    token { 'qwerytsdfcvbh' }
  end
end
