class ExportedItemsController < ApplicationController
  def index
    @exported_items = ExportedItem.all
  end
end 