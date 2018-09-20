class ImportsController < ApplicationController
  load_and_authorize_resource
  
  def indim; end

  def new; end

  def create
    if @import.save
      redirect_to imports_path, notice: "Luu thanh cong"
    else
      render 'new'
    end 
  end

  def show; end

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
end