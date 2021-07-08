class Reservation < ApplicationRecord
  
  belongs_to :customer
  belongs_to :service
  
  validate :reservation_validation
  # 予約システム時間指定のバリデーション
  # validates :id, uniqueness: { scope: [:start_time, :finish_time] }

        # if r.start_time < @reservation.finish_time && r.finish_time > @reservation.start_time
        # end
        

        
  
    def reservation_validation
      reservation = Reservation.where('start_time <= ? AND finish_time >= ?', finish_time, start_time)
      
      errors.add(:start_time, "時間が重複しています")if reservation.present?
    end

end
