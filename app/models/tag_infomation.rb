class TagInfomation < ApplicationRecord
  
  has_many :tags, dependent: :destroy, foreign_key: 'tag_infomation_id'
  has_many :columns, through: :tags
  
end
