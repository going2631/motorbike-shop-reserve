class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @reservations = Reservation.all
  end
  
  
end
