class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params.require(:product).permit(:name, :price, :quantity, :country, :remarks, :supplier_id)
    if @product.save 
      redirect_to products_path, notice:"Luu thanh cong"
    else
      render 'new'
    end
  end
end
