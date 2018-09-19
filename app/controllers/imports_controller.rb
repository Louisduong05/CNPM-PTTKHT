class ImportsController < ApplicationController
  def index
    @imports = Import.all
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new params.require(:import).permit(:user_id, :price)
    if @import.save
      redirect_to imports_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def edit
    @import = Import.find(params[:id])
  end

  def update
    @import = Import.find(params[:id])
    if @import.update params.require(:import).permit(:user_id, :price)
      redirect_to imports_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  def destroy
    @import = Import.find(params[:id])
    @import.destroy
    redirect_to imports_path, notice: "Xoa thanh cong"
  end
end