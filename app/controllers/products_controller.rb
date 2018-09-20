class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index; end

  def new; end

  def create
    if @product.save 
      redirect_to products_path, notice:"Luu thanh cong"
    else
      render 'new'
    end
  end

  def edit;end

  def update
    if @product.update product_params
      redirect_to products_path, notice: "Cap nhat thanh cong"
    else
      render edit, notice:"Cap nhat that bai"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Xoa thanh cong"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :country, :remarks, :supplier_id, :brand_id)
  end
end
