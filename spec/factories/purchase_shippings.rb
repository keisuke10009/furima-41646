FactoryBot.define do
  factory :purchase_shipping do
    item_id              { Faker::Number.between(from: 1, to: 10) }
    user_id              { Faker::Number.between(from: 1, to: 10) }
    zip                  { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    area_id              { Faker::Number.between(from: 1, to: 47) }
    city                 { '新宿区' }
    street_address       { '新宿1-1-1' }
    building_name        { '森ビル' }
    telephone_number     { Faker::Base.numerify('###########') }
    purchase_id          { Faker::Number.between(from: 1, to: 10) }
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
