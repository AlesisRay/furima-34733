class Furima < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :price
    validates :text
    validates :category_id
    validates :item_status_id
    validates :shipping_charges_id
    validates :shipping_date_id
    validates :prefecture_id
  end
end