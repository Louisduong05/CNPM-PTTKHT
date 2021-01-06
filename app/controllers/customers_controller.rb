class CustomersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @customer_filter = CustomerFilter.new(@customers, customer_filter_params)
    @customers = @customer_filter.result.order("id ASC").paginate(:page => params[:page], :per_page => 3)
  end
  
  def new; end
  
  def create
    if @customer.save
      redirect_to customers_url, notice: t('common.notice.save_success')
    else
      render 'new', notice: t('common.notice.save_errors')
    end
  end

  def edit; end

  def update
    if @customer.update customer_params
      redirect_to customers_path, notice: t('common.notice.save_success')
    else
      render 'edit', notice: t('common.notice.save_errors')
    end
  end

  def destroy
    if @customer.exports.present?
      redirect_to customers_path, notice: "#{@customer.name} đã phát sinh giao dịch"
    else
      @customer.destroy
      redirect_to customers_path, notice: t('common.notice.save_success')
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :address)
  end

  def customer_filter_params
    return {} if params[:customer_filter].nil?

    params.require(:customer_filter).permit(:keyword)
  end
end
