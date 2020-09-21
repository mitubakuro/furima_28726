FactoryBot.define do
  factory :item do
    association :user
    item_name     { Faker::Food.dish }
    item_text     { Faker::Food.description }
    item_price    { 1000 }
    deli_fee_id      { 2 }
    condition_id     { 2 }
    category_id      { 2 }
    shipping_day_id  { 2 }
    shipping_area_id { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'test.png', content_type: 'image/png')
    end
  end
end
