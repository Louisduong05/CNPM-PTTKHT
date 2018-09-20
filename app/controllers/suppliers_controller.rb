class SuppliersController < ApplicationController
  load_and_authorize_resource
  
  def index; end
  
  def new; end
  
  def create
    if @supplier.save
      redirect_to suppliers_url, notice: "Save successfully"
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @supplier.update supplier_params
      redirect_to suppliers_path, notice: "Supplier has been updated successfully"
    else
      render 'edit'
    end
  end

  def destroy
  @supplier.destroy
    redirect_to suppliers_path, notice: "Supplier has been deleted successfully"
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :phone, :address)
  end
end
