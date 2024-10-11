FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '佐藤' }
    last_name             { '太郎' }
    first_name_kana       { 'サトウ' }
    last_name_kana        { 'タロウ' }
    birth_date            { Faker::Date.birthday(min_age: 12, max_age: 100) }
  end
end
