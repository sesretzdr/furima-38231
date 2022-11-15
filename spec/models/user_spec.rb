require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "signup#registration_post" do
    
    context "sessionに保存できる" do

      it "全てのカラムが埋まっていれば保存できる" do
        user = build(:user)
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "nicknameが20文字以下であれば保存できる" do
        user = build(:user, nickname: "1234567890abcdfghijk")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "emailが @ を含む英数字であれば保存できる" do
        user = build(:user, email: "test@test.com")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "passwordが7文字以上ならば保存できる" do
        user = build(:user, password: "tech123")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "passwordが128文字以下ならば保存できる" do
        user = build(:user, password: "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345678")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "last_nameが35文字以下ならば保存できる" do
        user = build(:user, last_name: "あかさたなはまやらわあかさたなはまやらわあかさたなはまやらわあかさたな")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "first_nameが35文字以下ならば保存できる" do
        user = build(:user, first_name: "あかさたなはまやらわあかさたなはまやらわあかさたなはまやらわあかさたな")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "kana_last_nameが35文字以下ならば保存できる" do
        user = build(:user, kana_last_name: "アカサタナハマヤラワアカサタナハマヤラワアカサタナハマヤラワアカサタナ")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "kana_first_nameが35文字以下ならば保存できる" do
        user = build(:user, kana_first_name: "アカサタナハマヤラワアカサタナハマヤラワアカサタナハマヤラワアカサタナ")
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

      it "birthdayがdate型で存在すれば保存できる" do
        user = build(:user, birthday: Date.new(1990, 04, 02))
        user.valid?(:registration_post)
        expect(user).to be_valid
      end

end
