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

  def edit
    @export = Export.find(params[:id])
  end

  def update
    @export = Export.find(params[:id])
    if @export.update params.require(:export).permit(:user_id, :price)
      redirect_to exports_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end
end