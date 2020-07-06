class ExportsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @export_filter = ExportFilter.new(@exports, export_filter_params)
    @exports = @export_filter.result
    @export = Export.new
  end

  def new
    @export.exported_items.new
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'exports/report', pdf: 'Report'
      end
    end
  end

  def create
    if @export.save export_params
      redirect_to exports_path, notice: "Luu thanh cong"
    else
      error_message = @export.errors.messages.values.flatten.join(", ")
      flash.now[:notice] = error_message if error_message.present?
      flash.now[:notice] = "Save errors" if error_message.blank?
      render 'new'
    end 
  end

  def edit; end

  def update
    if @export.update export_params
      redirect_to exports_path, notice: "Cap nhat thanh cong"
    else
      error_message = @export.errors.messages.values.flatten.join(", ")
      flash.now[:notice] = error_message if error_message.present?
      flash.now[:notice] = "Save errors" if error_message.blank?
      render 'edit'
    end  
  end

  # def destroy
  #   @export = Export.find(params[:id])
  #   redirect_to exports_path, notice: "Xoa thanh cong"
  # end

  private

  def export_params
    data = params.require(:export).permit(
      :customer_id,
      exported_items_attributes: [
        :id,
        :quantity,
        :product_id,
        :_destroy
      ]
    )

    if action_name == "update"
      data.delete(:quantity)
    end

    data[:user_id] = current_user.id

    data
  end

  def export_filter_params
    return {} if params[:export_filter].nil?

    params.require(:export_filter).permit(:user_id)
  end
end