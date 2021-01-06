class Api::WarehousesController < Api::BaseController
  def index
    warehouse = Warehouse.first
    excess_capacity = warehouse.capacity - warehouse.current
    products = Product.where('products.quantity > 0')
    res = []
    products.each do |product|
      res << {
        name: product.name,
        current: product.quantity*product.size
      }
    end

    res << {
      name: 'còn lại',
      current: warehouse.current
    }
    render json: res, status: 200
  end
end
