class Reservation < ApplicationRecord
  
  belongs_to :customer
  belongs_to :service
  
  # 予約システム時間指定のバリデーション
  validates :id, uniqueness: { scope: [:start_time, :finish_time] }

  
end
