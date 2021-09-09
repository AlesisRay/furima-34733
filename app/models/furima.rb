class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_charge
  belongs_to :item_status
  belongs_to :category

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :title
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
    validates :info
    validates :image

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :item_status_id
      validates :shipping_charge_id
      validates :shipping_date_id
      validates :prefecture_id
    end
  end
end

