FactoryBot.define do
  factory :purchase_address do
    token { 'eovnieonvievsa' }
    postal_code { '777-7777' }
    prefecture_id { Faker::Number.within(range: 1..2) }
    municipality { '東京' }
    address { '神奈川' }
    phone_number { '00000000000' }
    building_name  { 'テスト' }
    end
  end
