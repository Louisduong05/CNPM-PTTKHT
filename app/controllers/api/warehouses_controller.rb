class Api::WarehousesController < Api::BaseController
  def index
    warehouses = Warehouse.all
    res = []
    warehouses.each do |warehouse|
      res << {
        name: warehouse.name,
        current: warehouse.current,
        capacity: warehouse.capacity
      }
    end
    render json: res, status: 200
  end
end
