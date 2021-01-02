class BrandsController < ApplicationController
  load_and_authorize_resource

  def index
    @brands = @brands.order("id ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def new; end

  def create
    if @brand.save brand_params
      redirect_to brands_path, notice: t('common.notice.save_success')
    else
      render 'new', notice: t('common.notice.save_errors')
    end 
  end

  def edit; end

  def update
    if @brand.update brand_params
      redirect_to brands_path, notice: t('common.notice.save_success')
    else
      render 'edit', notice: t('common.notice.save_errors')
    end  
  end

  def destroy
    @brand.destroy!
    redirect_to brands_path, notice: t('common.notice.save_success')
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :is_active)
  end
end