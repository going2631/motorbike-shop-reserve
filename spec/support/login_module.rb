module LoginModule


  def login(customer)
      visit new_customer_session_path
      fill_in 'customer_email', with: customer.email
      fill_in 'customer_password', with: 'nyannyan'
      click_button 'Log in'
  end

end