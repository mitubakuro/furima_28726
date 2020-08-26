FactoryBot.define do
  factory :item do
    association :user
    item_name     { Faker::Food.dish }
    item_text     { Faker::Food.description }
    item_price    { 1000 }
    deli_fee      { 2 }
    condition     { 2 }
    category      { 2 }
    shipping_day  { 2 }
    shipping_area { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'test.png', content_type: 'image/png')
    end
  end
end
