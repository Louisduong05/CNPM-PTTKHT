class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @product_filter = ProductFilter.new(@products, product_filter_params)
    @products = @product_filter.result.order("id ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def new; end

  def create
    if @product.save 
      redirect_to products_path, notice:"Save successfully"
    else
      render 'new', notice:"Save errors"
    end
  end

  def show;end

  def edit;end

  def update
    if @product.update product_params
      redirect_to products_path, notice: "Save successfully"
    else
      render edit, notice:"Save Errors"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Destroy successfully"
  end

  private

  def product_params
    params.require(:product).permit(:name, :original_price, :country, :remarks, :supplier_id, :brand_id, :image)
  end

  def product_filter_params
    if params[:product_filter].nil?
      return {} 
    else  
      params.require(:product_filter).permit(
        :keyword,
        :brand_id
      )
    end  
  end
end
