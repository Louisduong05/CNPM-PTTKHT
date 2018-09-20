class ExportsController < ApplicationController
  load_and_authorize_resource
  
  def index; end

  def new; end

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
        exported_items_attributes: [
          :id,
          :product_id,
          :unit_price,
          :_destroy
        ]
      )
    end
  end
end