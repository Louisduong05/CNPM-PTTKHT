class CustomersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @customer_filter = CustomerFilter.new(@customers, customer_filter_params)
    @customers = @customer_filter.result
  end
  
  def new; end
  
  def create
    if @customer.save
      redirect_to customers_url, notice: "Save successfully"
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @customer.update customer_params
      redirect_to customers_path, notice: "customer has been updated successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: "customer has been deleted successfully"
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :address)
  end

  def customer_filter_params
    return {} if params[:customer_filter].nil?

    params.require(:customer_filter).permit(:keyword)
  end
end
