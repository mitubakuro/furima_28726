FactoryBot.define do
  factory :user do
    nickname              { Faker::Movies::StarWars.character }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    family_kana           { Gimei.last.katakana }
    first_kana            { Gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1990-01-01', to: '2019-09-25') }
  end
end
