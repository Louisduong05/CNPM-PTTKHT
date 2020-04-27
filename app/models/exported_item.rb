class ExportedItem < ApplicationRecord
  extend Enumerize

  belongs_to :export
  belongs_to :product
  belongs_to :warehouse

  validates :quantity,     presence: true
  validates :quantity,     numericality: { greater_than: 0 }

  after_create :export_product 
  before_validation :add_warehouse

  enumerize :status, in: ["Done", "Undone"], default: "Undone"

  def add_warehouse
    self.warehouse_id = Warehouse.first.id
  end

  def total_price
    quantity * unit_price
  end

  def export_product
    product.quantity = product.quantity - quantity
    if product.quantity.negative?
      # Importer.all.each do |importer|
      #   Notification.create(user: importer, link: "/products/#{product.id}", message: "Need to enter more " + product.name)
      # end
      errors.add(:error, 'not enough')
      return false
    else
      product.save
      minus_current_warehouse
    end
  end

  def check_worehouse
    return if warehouse.capacity.to_i - plus_current_warehouse >= 0
    errors.add(:error, 'not enough')
    false
  end

  def unit_price
    product.unit_price_with_tax
  end

  private

  def minus_current_warehouse
    warehouse.current.to_i - product.size*quantity
  end
end
