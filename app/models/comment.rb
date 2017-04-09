class Comment < ApplicationRecord
  belongs_to :appraisal
  belongs_to :product

  has_many :comment_photos
end
