class ExportedItemsController < ApplicationController
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

end 