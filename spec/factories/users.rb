FactoryBot.define do
  factory :user do
    nickname              {Faker::Movies::StarWars.character}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    family_kana {}
    first_kana {}
    birthday {}
  end
end