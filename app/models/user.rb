class User < ApplicationRecord
  has_many :activities
  has_many :appraisals
  has_many :orders
end
