FactoryBot.define do
  factory :item do
    name                    { Faker::Name.initials(number: 4) }
    explanation             { Faker::Lorem.sentence }
    category_id             { Faker::Number.between(from: 1, to: 10) }
    condition_id            { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_charge_id  { Faker::Number.between(from: 1, to: 2) }
    area_id                 { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id         { Faker::Number.between(from: 1, to: 3) }
    price                   { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
