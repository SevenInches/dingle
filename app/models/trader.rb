class Trader < ApplicationRecord
  has_many :products
  has_many :orders

  has_one :trader_detail

  belongs_to :deliver

  #status： {1:开放 2:暂时闭店 3:关闭}
  OPEN_STATUS  = 1
  OUT_STATUS   = 2
  CLOSE_STATUS = 3

  def scores

  end

  def order_total
    try(:orders) ? orders.count : 0
  end

end
