require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '商品の出品' do
    it '全ての項目の入力が存在すれば登録できる' do
      expect(@furima).to be_valid
    end

    # presence true

    it '商品名が空では登録できない' do
      @furima.title = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Title can't be blank"
    end
    it '商品の説明が空では登録できない' do
      @furima.info = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Info can't be blank"
    end
    it 'カテゴリーの情報が空では登録できない' do
      @furima.category_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態が空では登録できない' do
      @furima.item_status_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Item status can't be blank"
    end
    it '配送料の負担についての情報が空では登録できない' do
      @furima.shipping_charge_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Shipping charge can't be blank"
    end
    it '発送までの日にちについての情報が空では登録できない' do
      @furima.shipping_date_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Shipping date can't be blank"
    end
    it '発送元の地域についての情報が空では登録できない' do
      @furima.prefecture_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Prefecture can't be blank"
    end

    #販売価格制限

    it '販売価格は、¥300未満では保存できない' do
      @furima.price = 200
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Price is not included in the list"
    end
    it '販売価格は、¥9,999,999より大きい場合は保存できない' do
      @furima.price = 10000000
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Price is not included in the list"
    end
    it '販売価格は、¥300~¥9,999,999の間のみ保存できる' do
      @furima.price = 5000
      expect(@furima).to be_valid
    end

    #販売価格は半角数字のみ

    it '販売価格が半角数字のみでなければ登録できない' do
      @furima.price = '１０００'
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Price is not included in the list"
    end
    it '価格が半角英数混合では登録できないこと' do
      @furima.price = '11111k'
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Price is not a number"
    end
    it '価格が半角英語だけでは登録できないこと' do
      @furima.price = 'kkkkkk'
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Price is not included in the list"
    end

    #user
    it 'userが紐付いていなければ出品できない' do
      @furima.user = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include "User must exist"
    end

  end
end
