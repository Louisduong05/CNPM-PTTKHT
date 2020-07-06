class ExportedItem < ApplicationRecord
  extend Enumerize

  belongs_to :export
  belongs_to :product
  belongs_to :warehouse

  validates :quantity,     presence: true
  validates :quantity,     numericality: { greater_than: 0 }

  after_validation :export_product, on: :create
  before_validation :add_values

  enumerize :status, in: ["Done", "Undone"], default: "Undone"

  def add_values
    self.warehouse_id = Warehouse.first.id
    self.unit_price = product.unit_price_with_tax
  end

  def total_price
    quantity * unit_price
  end

  def export_product
    product.quantity = self.product.quantity - self.quantity
    if product.quantity <= 0
      Importer.all.each do |importer|
        Notification.create(user: importer, link: "/products/#{product.id}", message: "Need to enter more " + product.name)
      end
      errors.add(:notice, 'not enough')
      return false
    else
      product.save
      minus_current_warehouse
    end
  end

  def unit_price
    product.unit_price_with_tax
  end

  private

  def minus_current_warehouse
    warehouse.current.to_i - product.size*quantity
  end
end
