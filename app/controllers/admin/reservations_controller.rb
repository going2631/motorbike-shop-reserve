class Admin::ReservationsController < ApplicationController
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
    if @reservation.update(reservation_params)
      redirect_to admin_reservation _path(@reservation.id)
    else
      render "edit"
    end
  end
end
