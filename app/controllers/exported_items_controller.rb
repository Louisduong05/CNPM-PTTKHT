class ExportedItemsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @exported_items = ExportedItem.all
  end

  def new
    @exported_item = ExportedItem.new
  end

  def create
    @exported_item = ExportedItem.new params.require(:exported_item).permit(:product_id, :quantity, :unit_price, :export_id)
    if @exported_item.save
      redirect_to  exported_items_path, notice: "Luu thanh cong"
    else
      render 'new', notice: "Luu that bai"
    end  
  end

  def edit
    @exported_item = ExportedItem.find(params[:id])
  end

  def update
    @exported_item = ExportedItem.find(params[:id])
    if @exported_item.update params.require(:exported_item).permit(:product_id, :quantity, :unit_price, :export_id)
      redirect_to exported_items_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"               
    end        
  end

  def destroy
    @exported_item = ExportedItem.find(params[:id])
    @exported_item.destroy
    redirect_to exported_items_path, notice:"Xoa Thanh cong"
  end
end 