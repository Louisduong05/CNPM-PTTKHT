class ImportedItemsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @imported_items = ImportedItem.all
  end

  def new
    @imported_item = ImportedItem.new
  end

  def create
    @imported_item = ImportedItem.new params.require(:imported_item).permit(:product_id, :quantity, :unit_price, :import_id)
    if @imported_item.save
      redirect_to  imported_items_path, notice: "Luu thanh cong"
    else
      render 'new', notice: "Luu that bai"
    end  
  end

  def edit
    @imported_item = ImportedItem.find(params[:id])
  end

  def update
    @imported_item = ImportedItem.find(params[:id])
    if @imported_item.update params.require(:imported_item).permit(:product_id, :quantity, :unit_price, :import_id)
      redirect_to imported_items_path, notice: "Cap nhat thanh cong"
    else
      render 'edit', notice: "Cap nhat that bai"               
    end        
  end

  def destroy
    @imported_item = ImportedItem.find(params[:id])
    @imported_item.destroy
    redirect_to imported_items_path, notice:"Xoa Thanh cong"
  end
end 