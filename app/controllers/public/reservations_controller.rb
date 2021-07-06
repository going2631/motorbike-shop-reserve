class Public::ReservationsController < ApplicationController
  def new
    @reservation = Rservation.new
  end
  
  def create
    @reservation = Rservation.new(reservation_params)
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
  
  def confirm
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:service_id,:customer_id, :manufacturer, :name, :displacement, :start_time, :finish_time)
  end
end
