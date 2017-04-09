class Appraisal < ApplicationRecord
  belongs_to :user
  belongs_to :order

  has_many :comments
end
