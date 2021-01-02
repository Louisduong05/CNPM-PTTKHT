class PaysController < ApplicationController
  load_and_authorize_resource

  def index
    @pay_filter = PayFilter.new(@pays, pay_filter_params)
    @pays = @pay_filter.result.order("id ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def show
    respond_to do |format|
      format.pdf do
        render pdf: "Đơn hàng #{@pay.code}",
        page_size: 'A4',
        template: "pays/show.html.slim",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def edit; end

  def update
    if @pay.update pay_params
      redirect_to pays_path, notice: t('common.notice.save_success')
    else
      # error_message = @export.errors.messages.values.flatten.join(", ")
      # flash.now[:notice] = error_message if error_message.present?
      # flash.now[:notice] = "Save errors" if error_message.blank?
      render 'edit', notice: t('common.notice.save_errors')
    end
  end

  def cancel
    if @pay.status == 'temporary'
      @pay.update(status: 'cancel')
      redirect_to pays_path, notice: t('common.notice.save_success')
    else
      redirect_to pays_path, notice: 'Đơn hàng đã hoàn thành'
    end
  end

  def official
    if @pay.status == 'temporary'
      @pay.update(status: 'official')
      redirect_to pays_path, notice: t('common.notice.save_success')
    else
      redirect_to pays_path, notice: 'Đơn hàng đã hoàn thành'
    end
  end

  def pay_params
    data = params.require(:pay).permit(
      :payment_by
    )
    data[:user_id] = current_user.id
    data[:payment_by] = data[:payment_by].to_i

    data
  end

  def pay_filter_params
    if params[:pay_filter].nil?
      return {} 
    else  
      params.require(:pay_filter).permit(
        :status
      )
    end 
  end
end