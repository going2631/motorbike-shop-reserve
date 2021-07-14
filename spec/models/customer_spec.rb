require 'rails_helper'

RSpec.describe 'customerモデルのテスト', type: :model do

describe Customer do
  describe '#create' do

    it "first_nameがない場合は登録できないこと" do
      customer = build(:customer, first_name: "")
      customer.valid?
      expect(customer.errors[:first_name]).to include("を入力してください")
    end

    it "last_nameがない場合は登録できないこと" do
      customer = build(:customer, last_name: "")
      customer.valid?
      expect(customer.errors[:last_name]).to include("を入力してください")
    end
    
    it "first_name_kanaがない場合は登録できないこと" do
      customer = build(:customer, first_name_kana: "")
      customer.valid?
      expect(customer.errors[:first_name_kana]).to include("を入力してください")
    end
    
    it "last_name_kanaがない場合は登録できないこと" do
      customer = build(:customer, last_name_kana: "")
      customer.valid?
      expect(customer.errors[:last_name_kana]).to include("を入力してください")
    end
    
    it "telephone_numberがない場合は登録できないこと" do
      customer = build(:customer, telephone_number: "")
      customer.valid?
      expect(customer.errors[:telephone_number]).to include("を入力してください")
    end
    
    it "emailがない場合は登録できないこと" do
      customer = build(:customer, email: "")
      customer.valid?
      expect(customer.errors[:email]).to include("を入力してください")
    end
    
    it "passwordがない場合は登録できないこと" do
      customer = build(:customer, password: "")
      customer.valid?
      expect(customer.errors[:password]).to include("を入力してください")
    end
    
    it "password_confirmationがない場合は登録できないこと" do
      customer = build(:customer, password_confirmation: "")
      customer.valid?
      expect(customer.errors[:password_confirmation]).to include("を入力してください")
    end
    
    
    
  end
  
  describe '#update' do

    it "first_nameがない場合は登録できないこと" do
      customer = build(:customer, first_name: "")
      customer.valid?

      expect(customer.errors[:first_name]).to include("を入力してください")
    end

    it "last_nameがない場合は登録できないこと" do
      customer = build(:customer, last_name: "")
      customer.valid?
      expect(customer.errors[:last_name]).to include("を入力してください")
    end
    
    it "first_name_kana_nameがない場合は登録できないこと" do
      customer = build(:customer, first_name_kana: "")
      customer.valid?
      expect(customer.errors[:first_name_kana]).to include("を入力してください")
    end
    
    it "last_name_kanaがない場合は登録できないこと" do
      customer = build(:customer, last_name_kana: "")
      customer.valid?
      expect(customer.errors[:last_name_kana]).to include("を入力してください")
    end
    
    it "telephone_numberがない場合は登録できないこと" do
      customer = build(:customer, telephone_number: "")
      customer.valid?
      expect(customer.errors[:telephone_number]).to include("を入力してください")
    end
    
    it "emailがない場合は登録できないこと" do
      customer = build(:customer, email: "")
      customer.valid?
      expect(customer.errors[:email]).to include("を入力してください")
    end
    
    it "passwordがない場合は登録できないこと" do
      customer = build(:customer, password: "")
      customer.valid?
      expect(customer.errors[:password]).to include("を入力してください")
    end
    
    it "password_confirmationがない場合は登録できないこと" do
      customer = build(:customer, password_confirmation: "")
      customer.valid?
      expect(customer.errors[:password_confirmation]).to include("を入力してください")
    end
    
    
    
  end
end
end