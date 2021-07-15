require 'rails_helper'

RSpec.describe Reservation, type: :system do
  
  let(:customer) { create(:customer) }
  let(:service) { create(:service)}
  describe 'reservation' do
    before { login(customer) }
      describe '予約作成' do
        context 'フォームの入力値が正常（trueデータ）' do
          it 'ユーザーの予約作成が成功' do
            # ユーザー新規登録画面へ遷移
            visit new_service_reservation_path(service.id)
            
            # manufacturerテキストフィールドにhogeと入力
            fill_in 'reservation_manufacturer', with: 'hoge'
            # nameテキストフィールドにhogeと入力
            fill_in 'reservation_name', with: 'hoge'
            # displacementテキストフィールドに1と入力
            fill_in 'reservation_displacement', with: '1'
            # extraテキストフィールドにhogeと入力
            fill_in 'reservation_extra', with: 'hoge'
            # start_timedatetimeフィールドに2021-07-10 12:00:00と入力
            fill_in 'reservation_start_time', with: '2021-07-10 12:00:00'

            click_button '予約を完了'
            # reservations_confirm_pathへ遷移することを期待する
            expect(current_path).to eq reservations_confirm_path
            # 遷移されたページに'ご予約完了致しました。'の文字列があることを期待する
            expect(page).to have_content 'ご予約完了致しました。'
         end
        end
        
        context '車名未記入（falseデータ）' do
          it 'ユーザーの予約作成が失敗' do
            
            # ユーザー新規登録画面へ遷移
            visit new_service_reservation_path(service.id)
            # manufacturerテキストフィールドにhogeと入力
            fill_in 'reservation_manufacturer', with: 'hoge'
            # nameテキストフィールドにhogeと入力
            fill_in 'reservation_name', with: nil
            # displacementテキストフィールドに1と入力
            fill_in 'reservation_displacement', with: '1'
            # extraテキストフィールドにhogeと入力
            fill_in 'reservation_extra', with: 'hoge'
            # start_timedatetimeフィールドに2021-07-10 12:00:00と入力
            fill_in 'reservation_start_time', with: '2021-07-10 12:00:00'
            
            click_button '予約を完了'
            # reservations_confirm_pathへ遷移することを期待する
            expect(current_path).to eq service_reservations_path(service.id)
           
            # 遷移されたページに'ご予約完了致しました。'の文字列があることを期待する
            expect(page).to have_content '件のエラーが発生しました'
         end

        end

      end

  end

end