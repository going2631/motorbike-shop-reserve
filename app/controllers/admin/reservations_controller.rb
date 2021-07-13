class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to admin_root_path
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @service = Service.find(@reservation.service_id)
    @reservation.finish_time =  @reservation.start_time + (@service.time.hours)
    
    if @reservation.update(reservation_params)
      redirect_to admin_reservation_path(@reservation.id)
    else
      render "edit"
    end
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:service_id,:customer_id, :manufacturer, :name, :displacement, :start_time, :finish_time)
  end
  
  
end
