FactoryBot.define do
  factory :user do
    nickname              { "テスト" }
    email                 { "usertest@usertest.com" }
    password              { "test123" }
    password_confirmation { "test123" }
    last_name             { "山田" }
    first_name            { "太郎" }
    last_name_kana        { "ヤマダ" }
    first_name_kana       { "タロウ" }
    birth_date            { Date.new(1990, 01, 01) }
  end
end