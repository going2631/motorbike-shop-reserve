class Reservation < ApplicationRecord
  
  belongs_to :customer
  belongs_to :service
  
  validate :reservation_validation
  validates :service_id, presence: true
  validates :customer_id, presence: true
  validates :manufacturer, presence: true
  validates :name, presence: true
  validates :displacement, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  
  # 予約システム時間指定のバリデーション（時間重複）
    def reservation_validation
      reservation = Reservation.where('start_time <= ? AND finish_time >= ?', finish_time, start_time)
      
      errors.add(:start_time, "時間が重複しています")if reservation.present?
    end

end
