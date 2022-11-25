require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('public/images/test_image.png')
    end

    context '登録できるとき' do
    it '必須項目を入力した上で出品ができる' do
      expect(@product).to  be_valid
    end
  end
  context '登録できないとき' do
    it '画像がないと登録できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がないと登録できない' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がないと登録できない' do
      @product.explanation = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーのプルダウンが---だと登録できない' do
      @product.category_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Category select')
    end

    it '商品の状態についてのプルダウンが---だと登録できない' do
      @product.status_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Status select')
    end

    it '配送料の負担についてのプルダウンが---だと登録できない' do
      @product.derively_fee_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Derively fee select')
    end

    it '発送元の地域についてのプルダウンが---だと登録できない' do
      @product.prefecture_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Prefecture select')
    end

    it '発送までの日数についてのプルダウンが---だと登録できない' do
      @product.day_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Day select')
    end

    it '価格についての情報がないと登録できない' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円以下だと登録できない' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格が9999999円以上だと登録できない' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格についての情報がないと登録できない' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格は半角数字以外では登録できない' do
      @product.price = '１０００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
end