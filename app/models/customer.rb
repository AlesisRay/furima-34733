class Customer < ApplicationRecord
  belongs_to :purchase
  has_many :prefectures
end
