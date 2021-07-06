class Public::HomesController < ApplicationController

  def top
    @columns = Column.limit(5).order(" created_at DESC ")
  end

end
