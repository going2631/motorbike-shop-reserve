class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer
  
  
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render "edit"
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :telephone_number )
  end
  
  # 以下ユーザー制限用コード
  def correct_customer
        @customer = Customer.find(params[:id])
    unless @customer.id == current_customer.id
      redirect_to new_customer_session_path
    end
  end
  
end
