FactoryBot.define do
  factory :item do
    item_name     { Faker::Food.dish }
    item_text     { Faker::Food.description }
    item_price    { 1000 }
    deli_fee      { 1 }
    condition     { 1 }
    category      { 1 }
    shipping_day  { 1 }
    shipping_area { 1 }
    user_id       { 5 }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'test.png', content_type: 'image/png')
    end
  end
end

# after(:build) {
#   |item| item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'test.png', content_type: 'image/png')
# }
