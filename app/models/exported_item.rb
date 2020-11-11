class ExportedItem < ApplicationRecord
  extend Enumerize

  belongs_to :export
  belongs_to :product, required: true
  belongs_to :warehouse

  validates :quantity,     presence: true
  validates :quantity,     numericality: { greater_than: 0 }

  before_validation :export_product, on: :create
  after_create :update_product_and_warehouse

  def add_values
    self.warehouse_id = Warehouse.first.id
    self.unit_price = product.unit_price_with_tax
  end

  def total_price
    quantity * unit_price
  end

  def export_product
    return false unless product

    if(product.quantity - self.quantity).negative?
      ::Staff.all.each do |importer|
        Notification.create(user: importer, link: "/products/#{product.id}", message: "Cần nhập thêm " + product.name)
      end
      errors.add(:quantity, ':' + 'Products in warehouse currently are not enough')
      return false
    else
      add_values
    end
  end

  def update_product_and_warehouse
    product.quantity -= self.quantity
    product.save
    minus_current_warehouse
  end

  def unit_price
    product.unit_price_with_tax
  end

  private

  def minus_current_warehouse
    warehouse.current = warehouse.current - product.size*quantity
    warehouse.save
  end
end
