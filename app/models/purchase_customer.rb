class PurchaseCustomer
  include ActiveModel::Model
  attr_accessor :user_id, :furima_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :furima_id
    validates :token
  end

  def save
    purchase = Purchase.create(furima_id: furima_id, user_id: user_id)

    Customer.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                    phone_number: phone_number, building: building, purchase_id: purchase.id)
  end
end
