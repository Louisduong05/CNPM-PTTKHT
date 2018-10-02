class SuppliersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @supplier_filter = SupplierFilter.new(@suppliers, supplier_filter_params)
    @suppliers = @supplier_filter.result
    # if params[:keyword]
    #   @suppliers = Supplier.where('suppliers.name LIKE ?', "%#{params[:keyword]}%")
    # else
    #   @suppliers = Supplier.all
    # end
  end
  
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

  # def update_priority
  #   suppliers = {}
  #   params[:ids].each_with_index do |id, index|
  #     suppliers[id] = {priority: index + 1}
  #   end

  #   Supplier.update(suppliers.keys, suppliers.values)
  #   render nothing: true
  # end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :phone, :address)
  end

  def supplier_filter_params
    return {} if params[:supplier_filter].nil?

    params.require(:supplier_filter).permit(
      :keyword
    )
  end
end