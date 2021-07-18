class Admin::ColumnsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @columns = Column.all
    
    # 以下３行検索機能についてのコード
    if params[:keyword] != nil
      @columns = Column.search(params[:keyword])
      @keyword = params[:keyword]
    end
  end
  
  def new
    @column = Column.new
  end
  
  def create
    # 下記タグ作成用コードcolumnモデルにて使用するtag_ぃstの作成
    tag_list = params[:column][:tag_name].split(",")
    @column = Column.new(column_params)
    @column.admin_id = current_admin.id
    
    if @column.save
      # 下記タグ作成用コード
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
    redirect_to admin_columns_path
  end
  
  
  private
  
  def column_params
    params.require(:column).permit(:admin_id, :image, :title, :text)
  end
  
end
