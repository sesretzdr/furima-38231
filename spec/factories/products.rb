FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.sentence   }
    category_id { Faker::Number.within(range: 1..2) }
    derively_fee_id { Faker::Number.within(range: 1..2) }
    status_id { Faker::Number.within(range: 1..2) }
    prefecture_id { Faker::Number.within(range: 1..2) }
    day_id { Faker::Number.within(range: 1..2) }
    price { 3000 }
    association :user
  end
end