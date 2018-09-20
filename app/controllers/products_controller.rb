class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params_product
    if @product.save 
      redirect_to products_path, notice:"Luu thanh cong"
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update params_product
      redirect_to products_path, notice: "Cap nhat thanh cong"
    else
      render edit, notice:"Cap nhat that bai"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Xoa thanh cong"
  end

  private

  def params_product
    params.require(:product).permit(:name, :price, :country, :remarks, :supplier_id)
  end
end
