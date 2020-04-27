class ImportedItemsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @imported_items = @imported_items.where(status: 'Undone')
    @imported_items = @imported_items.order("id ASC").paginate(:page => params[:page], :per_page => 3)
  end

  def edit
    gon.push({
      quantity: @imported_item.quantity
    })
    @imported_item.product_items.new
  end

  def update
    if @imported_item.update_attributes imported_item_params
      redirect_to imported_items_path, notice: "Save successfully"
    else
      render 'edit', notice: "Save errors"
    end 
  end

  private

  def imported_item_params
    data = params.require(:imported_item).permit(
      product_items_attributes: [
        :id,
        :code,
        :_destroy
      ]
    )
    data[:product_items_attributes].each do |product_item|
      product_item[1][:user_id] = current_user.id
      product_item[1][:product_id] = @imported_item.product_id
    end

    data
  end
end