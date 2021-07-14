require 'rails_helper'

RSpec.describe 'serviceモデルのテスト', type: :model do

describe Service do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      service = build(:service, name: "")
      service.valid?
      expect(service.errors[:name]).to include("を入力してください")
    end

    it "introductionがない場合は登録できないこと" do
      service = build(:service, introduction: "")
      service.valid?
      expect(service.errors[:introduction]).to include("を入力してください")
    end
    
    it "priceがない場合は登録できないこと" do
      service = build(:service, price: "")
      service.valid?
      expect(service.errors[:price]).to include("を入力してください")
    end
    
    it "timeがない場合は登録できないこと" do
      service = build(:service, time: "")
      service.valid?
      expect(service.errors[:time]).to include("を入力してください")
    end
    
  end
  
  describe '#update' do

     it "nameがない場合は登録できないこと" do
       service = build(:service, name: "")
       service.valid?
        expect(service.errors[:name]).to include("を入力してください")
     end

      it "introductionがない場合は登録できないこと" do
        service = build(:service, introduction: "")
        service.valid?
        expect(service.errors[:introduction]).to include("を入力してください")
     end
    
      it "priceがない場合は登録できないこと" do
        service = build(:service, price: "")
        service.valid?
        expect(service.errors[:price]).to include("を入力してください")
      end
    
      it "timeがない場合は登録できないこと" do
        service = build(:service, time: "")
        service.valid?
        expect(service.errors[:time]).to include("を入力してください")
      end
    end
  end
end