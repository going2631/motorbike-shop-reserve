class Public::ColumnsController < ApplicationController
  
  def index
    @columns = Column.all
    # 以下３行検索機能についてのコード
    if params[:keyword] != nil
      @columns = Column.search(params[:keyword])
      @keyword = params[:keyword]
    end
  end
  
  def show
    @column = Column.find(params[:id])
  end

end
