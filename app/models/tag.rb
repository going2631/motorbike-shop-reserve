class Tag < ApplicationRecord
  
  belongs_to :column
  belongs_to :tag_infomation
  validates :column_id,presence:true
  validates :tag_infomation_id,presence:true
  
end
