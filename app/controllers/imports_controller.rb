class ImportsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @import_filter = ImportFilter.new(@imports, import_filter_params)
    @imports = @import_filter.result.order("id ASC").paginate(:page => params[:page], :per_page => 3)
    @import = Import.new
  end

  def new
    @import.imported_items.new
  end

  def official
    if @import.status == 'temporary'
      @import.update(status: 'official')
      redirect_to imports_path, notice: t('common.notice.save_success')
    else
      redirect_to imports_path, notice: 'Đơn đã kết thúc'
    end
  end

  def cancel
    if @import.status == 'temporary'
      @import.update(status: 'cancel')
      redirect_to imports_path, notice: t('common.notice.save_success')
    else
      redirect_to imports_path, notice: 'Đơn đã được hoàn thành'
    end
  end

  def create
    if @import.save import_params
      redirect_to imports_path, notice: t('common.notice.save_success')
    else
      # error_message = @import.errors.messages.values.flatten.join(", ")
      # flash.now[:notice] = error_message if error_message.present?
      # flash.now[:notice] = "Save errors" if error_message.blank?
      render 'new', notice: t('common.notice.save_errors')
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
      redirect_to imports_path, notice: t('common.notice.save_success')
    else
      # error_message = @import.errors.messages.values.flatten.join(", ")
      # flash.now[:notice] = error_message if error_message.present?
      # flash.now[:notice] = "Save errors" if error_message.blank?
      render 'new', notice: t('common.notice.save_errors')
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