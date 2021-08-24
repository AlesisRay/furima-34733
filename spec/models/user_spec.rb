require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全ての項目の入力が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    # presence true

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end

    # email 一意性

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end

     # email ＠必須

     it 'emailは、@を含む必要があること' do
      @user.email = 'takuya.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    # password 6文字

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = '1234kt'
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '123kt'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    # password 半角英数字が必要

    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'passwordが半角英数のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'passwordに全角英数があれば登録できない' do
      @user.password = '12345ｋ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end

    # 全角文字制限 名前

    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'ｶﾜﾓﾄー'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
    end
    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'ﾀｸﾔ々'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name 全角文字を使用してください'
    end

    # 全角カタカナ制限 カナ

    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'ｶﾜﾓﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana 全角カタカナのみで入力して下さい'
    end
    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = 'ｶﾜﾓﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana 全角カタカナのみで入力して下さい'
    end
    
  end
end
