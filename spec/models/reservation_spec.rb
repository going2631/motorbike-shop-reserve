require 'rails_helper'

RSpec.describe 'reservationモデルのテスト', type: :model do

describe Reservation do
  describe '#create' do

    it "service_idがない場合は登録できないこと" do
      reservation = build(:reservation, service_id: "")
      reservation.valid?
      expect(reservation.errors[:service_id]).to include("を入力してください")
    end

    it "customer_idがない場合は登録できないこと" do
      reservation = build(:reservation, customer_id: "")
      reservation.valid?
      expect(reservation.errors[:customer_id]).to include("を入力してください")
    end
    
    it "manufacturerがない場合は登録できないこと" do
      reservation = build(:reservation, manufacturer: "")
      reservation.valid?
      expect(reservation.errors[:manufacturer]).to include("を入力してください")
    end
    
    it "nameがない場合は登録できないこと" do
      reservation = build(:reservation, name: "")
      reservation.valid?
      expect(reservation.errors[:name]).to include("を入力してください")
    end
    
    it "displacementがない場合は登録できないこと" do
      reservation = build(:reservation, displacement: "")
      reservation.valid?
      expect(reservation.errors[:displacement]).to include("を入力してください")
    end

    it "start_timeがない場合は登録できないこと" do
      reservation = build(:reservation, start_time: "")
      reservation.valid?
      expect(reservation.errors[:start_time]).to include("を入力してください")
    end
    
    it "finish_timeがない場合は登録できないこと" do
      reservation = build(:reservation, finish_time: "")
      reservation.valid?
      expect(reservation.errors[:finish_time]).to include("を入力してください")
    end
    
    
    
  end
  
  describe '#update' do

   it "service_idがない場合は登録できないこと" do
      reservation = build(:reservation, service_id: "")
      reservation.valid?
      expect(reservation.errors[:service_id]).to include("を入力してください")
    end

    it "customer_idがない場合は登録できないこと" do
      reservation = build(:reservation, customer_id: "")
      reservation.valid?
      expect(reservation.errors[:customer_id]).to include("を入力してください")
    end
    
    it "manufacturerがない場合は登録できないこと" do
      reservation = build(:reservation, manufacturer: "")
      reservation.valid?
      expect(reservation.errors[:manufacturer]).to include("を入力してください")
    end
    
    it "nameがない場合は登録できないこと" do
      reservation = build(:reservation, name: "")
      reservation.valid?
      expect(reservation.errors[:name]).to include("を入力してください")
    end
    
    it "displacementがない場合は登録できないこと" do
      reservation = build(:reservation, displacement: "")
      reservation.valid?
      expect(reservation.errors[:displacement]).to include("を入力してください")
    end
    
    it "start_timeがない場合は登録できないこと" do
      reservation = build(:reservation, start_time: "")
      reservation.valid?
      expect(reservation.errors[:start_time]).to include("を入力してください")
    end
    
    it "finish_timeがない場合は登録できないこと" do
      reservation = build(:reservation, finish_time: "")
      reservation.valid?
      expect(reservation.errors[:finish_time]).to include("を入力してください")
    end
    
    
    
  end
end
end