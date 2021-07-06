class Admin::ColumnsController < ApplicationController
  
  def index
    @columns = Column.all
  end
  
  def new
    @column = Column.new
  end
  
  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to admin_column_path(@column.id)
    else
      render "new"
    end
  end
  
  def show
    @column = Column.find(params[:id])
  end
  
  def edit
    @column = Column.find(params[:id])
  end
  
  def update
    @column = Column.find(params[:id])
    if @colum.update(column_params)
      redirect_to admin_column_path(@column.id)
    else
      render "edit"
    end
  end
  
  def destroy
    @column = Column.find(params[:id])
    @column.destroy
    redirect_to admin_colums_path
  end
  
  private
  
  def column_params
    params.require(:column).permit(:admin_id, :image_id, :title, :text )
  end
  
end
