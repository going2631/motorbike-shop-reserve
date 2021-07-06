class Service < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
