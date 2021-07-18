module LoginModule

  # ログイン機能のテストコード
  def login(customer)
      visit new_customer_session_path
      fill_in 'customer_email', with: customer.email
      fill_in 'customer_password', with: 'nyannyan'
      click_button 'ログイン'
  end

end