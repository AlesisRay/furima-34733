require 'rails_helper'

RSpec.describe PurchaseCustomer, type: :model do
  before do
    user = FactoryBot.create(:user)
    furima = FactoryBot.create(:furima)
    @purchase_customer = FactoryBot.build(:purchase_customer, user_id: user.id, furima_id: furima.id)
    sleep 0.5
  end

  describe '商品の購入' do
    it '全ての項目の入力が存在すれば登録できる' do
      expect(@purchase_customer).to be_valid
    end

    # presence true

    it '郵便番号が空では登録できない' do
      @purchase_customer.postal_code = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include "Postal code can't be blank"
    end
    it '市区町村が空では登録できない' do
      @purchase_customer.municipality = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include "Municipality can't be blank"
    end
    it '番地が空では登録できない' do
      @purchase_customer.address = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include "Address can't be blank"
    end
    it '電話番号が空では登録できない' do
      @purchase_customer.phone_number = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include "Phone number can't be blank"
    end

    it '発送先の地域についての情報が空では登録できない' do
      @purchase_customer.prefecture_id = 1
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include "Prefecture can't be blank"
    end
    it 'tokenが空では登録できないこと' do
      @purchase_customer.token = nil
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include("Token can't be blank")
    end

    # ハイフンが必要

    it '郵便番号の保存にはハイフンがなければ登録できない' do
      @purchase_customer.postal_code = '1234567'
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include 'Postal code is invalid'
    end

    # 電話番号が11桁の数値のみ

    it '電話番号が11桁の数値でないと登録できないこと' do
      @purchase_customer.phone_number = '123456789876'
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include 'Phone number is invalid'
    end
  end
end
