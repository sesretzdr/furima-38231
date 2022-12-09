require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user )
      @product = FactoryBot.build(:product)
      @purchase = FactoryBot.build(:purchase_address, product_id: @product.id, user_id: @user.id)
    end
    context '購入できる時' do
    it '必須項目を入力した上で購入ができる' do
      expect(@purchase).to  be_valid
    end
    
    it '建物名が空でも購入できる' do
      @purchase.building_name = ''
      expect(@purchase).to  be_valid
    end

    
    
    end


    context '購入できな時' do
    it '郵便番号がないと登録できない' do
      @purchase.postal_code = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県についてのプルダウンが---だと登録できない' do
      @purchase.prefecture_id = 0
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture select')
    end

    it '市区町村がないと登録できない' do
      @purchase.municipality = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地がないと登録できない' do
      @purchase.address = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号がないと登録できない' do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が9桁以下では登録できない' do
      @purchase.phone_number = '123456789'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号に半角数字以外が含まれている場合は登録できない' do
      @purchase.phone_number = '12345678a'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号が12桁以上では登録できない' do
      @purchase.phone_number = '123456789012'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end


    it '電話番号にハイフンがあると登録できない' do
      @purchase.phone_number = '000-0000-0000'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end

    it '郵便番号にハイフンがないと登録できない' do
      @purchase.postal_code = '7777777'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postal code Input correctly')
    end

    it "tokenが空では登録できないこと" do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

   
    it 'ユーザーが紐付いていなければ投稿できない' do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end
    
    it "Productが紐付いていなければ投稿できない" do
      @purchase.product_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Product can't be blank")
    end

  

  end
end
end
