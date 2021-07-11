class Admin::ColumnsController < ApplicationController
  
  def index
    @columns = Column.all
    if params[:keyword] != nil
      @columns = Column.search(params[:keyword])
      @keyword = params[:keyword]
    end
  end
  
  def new
    @column = Column.new
  end
  
  def create
    tag_list = params[:column][:tag_name].split(",")
    @column = Column.new(column_params)
    @column.admin_id = current_admin.id
    if @column.save
      @column.save_column(tag_list)
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
    if @column.update(column_params)
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
  
  def search
    @columns = Column.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
  
  private
  
  def column_params
    params.require(:column).permit(:admin_id, :image, :title, :text)
  end
  
end
