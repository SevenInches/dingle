class Order < ApplicationRecord

  has_and_belongs_to_many :activities
  has_and_belongs_to_many :products

  has_many :appraisals

  belongs_to :trader
  belongs_to :user

end
