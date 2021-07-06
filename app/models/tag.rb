class Tag < ApplicationRecord
  
  belongs_to :column
  has_many :tag_infomations
  
end
