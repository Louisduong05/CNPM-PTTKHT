class ImportsController < ApplicationController
  load_and_authorize_resource
  
  def index; end

  def new; end

  def create
    if @import.save
      redirect_to imports_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def edit; end

  def update
    if @import.update
      redirect_to imports_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"
    end  
  end

  def destroy
    @import.destroy
    redirect_to imports_path, notice: "Xoa thanh cong"
  end

  private

  def import_params
    params.require(:import).permit(
      :user_id, 
      :price,
      imported_items_attributes: [
        :id,
        :product_id,
        :unit_price,
        :_destroy
      ]
    )
  end
end