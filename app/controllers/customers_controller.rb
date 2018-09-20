class CustomersController < ApplicationController
  load_and_authorize_resource
  
  def index; end
  
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
end
