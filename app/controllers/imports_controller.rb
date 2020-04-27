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
      redirect_to imports_path, notice: 'Save sucessfully'
    else
      error_message = @import.errors.messages.values.flatten.join(", ")
      flash.now[:notice] = error_message if error_message.present?
      flash.now[:notice] = "Save errors" if error_message.blank?
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
      redirect_to imports_path, notice: 'Save errors'
    else
      error_message = @import.errors.messages.values.flatten.join(", ")
      flash.now[:notice] = error_message if error_message.present?
      flash.now[:notice] = "Save errors" if error_message.blank?
      render 'edit'
    end  
  end

  private

  def import_params
    data = params.require(:import).permit(
      :supplier_id,
      imported_items_attributes: [
        :id,
        :quantity,
        :product_id,
        :unit_price,
        :_destroy
      ]
    )
    if action_name == "update"
      data.delete(:quantity)
    end

    data[:user_id] = current_user.id

    data
  end

  def import_filter_params
    return {} if params[:import_filter].nil?

    params.require(:import_filter).permit(:user_id)
  end
end