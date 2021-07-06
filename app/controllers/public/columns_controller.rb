class Public::ColumnsController < ApplicationController
  
  def index
    @columns = Column.all
  end
  
  def show
    @colum = Column.find(params[:id])
  end
  
end
