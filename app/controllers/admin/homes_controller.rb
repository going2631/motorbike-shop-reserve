class Admin::HomesController < ApplicationController
  def top
    @reservations = Reservation.al
  end
  
  
end
