class Public::FavoritesController < ApplicationController
  
  def create
    column = Column.find(params[:column_id])
    favorite = current_customer.favorites.new(column_id: column.id)
    favorite.save
    redirect_to  column_path(column)
  end
  
  def destroy
    column = Column.find(params[:column_id])
    favorite = current_customer.favorites.find_by(column_id: column.id)
    favorite.destroy
    redirect_to column_path(column)
    
  end
end
