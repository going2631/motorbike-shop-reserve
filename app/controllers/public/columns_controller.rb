class Public::ColumnsController < ApplicationController
  
  def index
    @columns = Column.all
    if params[:keyword] != nil
      @columns = Column.search(params[:keyword])
      @keyword = params[:keyword]
    end
  end
  
  def show
    @column = Column.find(params[:id])
  end

end
