class User < ApplicationRecord
  has_many :activities
  has_many :appraisals
  has_many :orders

  def sex
    case gender
      when 1 then '男'
      when 2 then '女'
      else
        '未知'
    end
  end
end
