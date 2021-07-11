class Public::ReservationsController < ApplicationController
  
  before_action :set_service, except: [:index, :confirm]
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @reservation.service_id = @service.id
    
    # 以下2行予約終了時間の自動算出
    @service = Service.find(params[:service_id])
    @reservation.finish_time =  @reservation.start_time + (@service.time.hours)
    
    if @reservation.save
      redirect_to reservations_confirm_path
    else
      render "new"
    end
    
  end
  
  def index
    @reservations = Reservation.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  # 注文後のthanksページ
  def confirm
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:service_id,:customer_id, :manufacturer, :name, :displacement, :start_time, :finish_time)
  end
  
  
  
  def set_service
     @service = Service.find(params[:service_id])
  end
end