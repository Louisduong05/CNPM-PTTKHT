class ExportsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @export_filter = ExportFilter.new(@exports, export_filter_params)
    @exports = @export_filter.result
    @export = Export.new
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'exports/report', pdf: 'Report'
      end
    end
  end

  def new; end

  def show
    respond_to do |format|
      format.pdf do
        render template: 'exports/report', pdf: 'Report'
      end
    end
  end

  def create
    if @export.save
      redirect_to exports_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def show
    @export = Export.find(params[:id])
  end

  def edit; end

  def update
    if @export.update export_params
      redirect_to exports_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  # def destroy
  #   @export = Export.find(params[:id])
  #   redirect_to exports_path, notice: "Xoa thanh cong"
  # end

  private

  def export_params
    if action_name == "create"
      params.require(:export).permit(
        :user_id,
        :customer_id,
        exported_items_attributes: [
          :id,
          :quantity,
          :product_id,
          :unit_price,
          :_destroy
        ]
      )
    else
      params.require(:export).permit(
        :user_id,
        :customer_id,
        exported_items_attributes: [
          :id,
          :product_id,
          :unit_price,
          :_destroy
        ]
      )
    end
  end

  def export_filter_params
    return {} if params[:export_filter].nil?

    params.require(:export_filter).permit(:user_id)
  end
end