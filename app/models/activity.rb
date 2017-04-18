class Activity < ApplicationRecord
  has_and_belongs_to_many :orders

  #status {1:正常}
  NORMAL_STATUS = 1
end
