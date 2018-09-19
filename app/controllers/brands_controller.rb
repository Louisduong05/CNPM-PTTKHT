class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new params.require(:brand).permit(:name, :country)
    if @brand.save
      redirect_to brands_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update params.require(:brand).permit(:name, :country)
      redirect_to brands_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to brands_path, notice: "Xoa thanh cong"
  end
end