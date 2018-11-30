class ImportsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @import_filter = ImportFilter.new(@imports, import_filter_params)
    @imports = @import_filter.result
    @import = Import.new
  end

  def new
    @import.imported_items.new
  end

  def create
    if @import.save import_params
      redirect_to imports_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'imports/report', pdf: 'Report'
      end
    end
  end

  def edit; end

  def update
    if @import.update import_params
      redirect_to imports_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  private

  def import_params
    if action_name == "create"
      params.require(:import).permit(
        :supplier_id,
        :user_id,
        imported_items_attributes: [
          :id,
          :quantity,
          :product_id,
          :unit_price,
          :_destroy
        ]
      )
    else
      params.require(:import).permit(
        :supplier_id,
        :user_id,
        imported_items_attributes: [
          :id,
          :product_id,
          :unit_price,
          :_destroy
        ]
      )
    end
  end

  def import_filter_params
    return {} if params[:import_filter].nil?

    params.require(:import_filter).permit(:user_id)
  end
end