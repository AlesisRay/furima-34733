class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :furimas

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
  
  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: '全角文字を使用してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナのみで入力して下さい' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
  
end
