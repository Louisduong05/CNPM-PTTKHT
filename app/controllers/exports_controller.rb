class ExportsController < ApplicationController
  def index
    @exports = Export.all
  end

  def new
    @export = Export.new
  end

  def create
    @export = Export.new params.require(:export).permit(:user_id, :price)
    if @export.save
      redirect_to exports_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end
end