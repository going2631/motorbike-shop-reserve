class Public::ReservationsController < ApplicationController
  def new
    @reservation = Rservation.new
  end
  
  def create
    # 保存されている予約情報の取得
    reservations = Reservation.all
    
    @reservation = Rservation.new(reservation_params)
    
    # 以下３行予約終了時間の自動算出
    service = Service.find(params[:servise_id])
    @reservation.start_time = params[start_time]
    @reservation.finish_time = start_time+ Rational(@service.time) 
    
    reservations .each do |r |
      if r.start_time < @reservation.finish_time && r.finish_time > @reservation.start_time
        render "new"
      else
        if @reservation.save
          redirect_to confirm_path
        else
          render "new"
        end
        
        
      end
    end

    
    if @reservation.save
      redirect_to 
    else
      render "new"
    end
  end
  
  def index
    @reservations = Rservation.all
  end
  
  def show
    @reservation = Rservation.find(params[:id])
  end
  
  # 注文後のthanksページ
  def confirm
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:service_id,:customer_id, :manufacturer, :name, :displacement, :start_time, :finish_time)
  end
end
