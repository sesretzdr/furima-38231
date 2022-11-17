FactoryBot.define do

  factory :user do
    nickname              { "テスト" }
    email                 { "usertest@usertest.com" }
    password              { "test123" }
    password_confirmation { "test123" }
    last_name             { "山田" }
    first_name            { "太郎" }
    kana_last_name        { "ヤマダ" }
    kana_first_name       { "タロウ" }
    birthday              { Date.new(1990, 01, 01) }
   
  end
end