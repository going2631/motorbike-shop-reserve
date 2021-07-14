require 'rails_helper'

RSpec.describe 'columnモデルのテスト', type: :model do

describe Column do
  describe '#create' do

    it "admin_idがない場合は登録できないこと" do
      column = build(:column, admin_id: "")
      column.valid?
      expect(column.errors[:admin_id]).to include("を入力してください")
    end

    it "image_idがない場合は登録できないこと" do
      column = build(:column, image_id: "")
      column.valid?
      expect(column.errors[:image_id]).to include("を入力してください")
    end
    
    it "titleがない場合は登録できないこと" do
      column = build(:column, title: "")
      column.valid?
      expect(column.errors[:title]).to include("を入力してください")
    end
    
    it "textがない場合は登録できないこと" do
      column = build(:column, text: "")
      column.valid?
      expect(column.errors[:text]).to include("を入力してください")
    end
    
  end
  
   describe '#update' do

     it "admin_idがない場合は更新できないこと" do
       column = build(:column, admin_id: "")
       column.valid?
       expect(column.errors[:admin_id]).to include("を入力してください")
     end

     it "image_idがない場合は更新できないこと" do
       column = build(:column, image_id: "")
       column.valid?
        expect(column.errors[:image_id]).to include("を入力してください")
     end
    
      it "titleがない場合は更新できないこと" do
       column = build(:column, title: "")
       column.valid?
       expect(column.errors[:title]).to include("を入力してください")
      end
    
     it "textがない場合は更新できないこと" do
        column = build(:column, text: "")
        column.valid?
        expect(column.errors[:text]).to include("を入力してください")
      end
    end
  end
end