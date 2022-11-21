require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    
    it '全て正しく入力されれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameがないと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスがないと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性でないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは@がない登録できない' do
      @user.email = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

   

    it '苗字がない場合は登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名前がない場合は登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    
    it '氏名カナがない場合は登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_nameが全角入力でなければ登録できないこと' do
      @user .last_name = "ｱｲｳｴｵ" 
      @user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      @user .first_name = "ｱｲｳｴｵ" 
      @user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

   

    it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
      @user .last_name_kana = "あいうえお" 
      @user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

   
  end
end
describe 'ユーザー新規登録' do
  context '正常に登録できる時' do
    it 'パスワードが半角英数混合であれば登録できる' do
      expect(@user).to be_valid
    end

    it 'パスワードがないと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが5文字以下では登録できない' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは確認用を含めて2回入力しないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


  end

  context '登録ができない時' do
    it 'パスワードが英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
    end
    it 'パスワードが数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
    end
  end
end