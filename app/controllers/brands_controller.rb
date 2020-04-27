class BrandsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def new; end

  def create
    if @brand.save brand_params
      redirect_to brands_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def edit; end

  def update
    if @brand.update brand_params
      redirect_to brands_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  def destroy
    @brand.destroy
    redirect_to brands_path, notice: "Xoa thanh cong"
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :country)
  end
end