class Address < ApplicationRecord
  belongs_to :user

  def total_name
    try(:name) + try(:title)
  end

  def title
    case gender
      when 1 then '先生'
      when 2 then '女士'
      else ''
    end
  end

  def tag_name
    case tag
      when 1 then '家'
      when 2 then '公司'
      when 3 then '学校'
      else ''
    end
  end
end
