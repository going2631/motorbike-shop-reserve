class Column < ApplicationRecord
  
  belongs_to :admin
  has_many :favorites
  has_many :tag, dependent: :destroy
  
  attachment :image
  
end
