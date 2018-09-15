class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end
  
  def new
    @supplier = Supplier.new
  end
  
  def create
    @supplier = Supplier.new supplier_params

    if @supplier.save
      redirect_to suppliers_url, notice: "Save successfully"
    else
      render 'new', notice: "Moi nhap lai"
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end
