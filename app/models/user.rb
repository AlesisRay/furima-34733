class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :furimas
  has_many :purchases

  validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナのみで入力して下さい' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true
end
