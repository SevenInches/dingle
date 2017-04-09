class Trader < ApplicationRecord
  has_many :products
  has_many :orders

  has_one :trader_detail
  belongs_to :deliver

end
