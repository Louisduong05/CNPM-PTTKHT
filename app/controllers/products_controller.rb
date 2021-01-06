class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @product_filter = ProductFilter.new(@products, product_filter_params)
    @products = @product_filter.result.order("id ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def new; end

  def statistical
    @products = @products.where('products.quantity > 0')
    @product_filter = ProductFilter.new(@products, product_filter_params)
    @products = @product_filter.result.order("id ASC")
  end

  def create
    if @product.save 
      redirect_to products_path, notice: t('common.notice.save_success')
    else
      render 'new', notice: t('common.notice.save_errors')
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

  def unactive
    @product.update(is_active: !@product.is_active)
    redirect_to products_path, notice: t('common.notice.save_success')
  end

  private

  def product_params
    params.require(:product).permit(:name, :original_price, :country, :remarks, :supplier_id, :image, :size)
  end

  def product_filter_params
    if params[:product_filter].nil?
      return {} 
    else  
      params.require(:product_filter).permit(
        :keyword
      )
    end  
  end
end
