class Service < ApplicationRecord
  has_many :reservations, dependent: :destroy
  
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :time, presence: true
  
end
