class ExportedItem < ApplicationRecord
  belongs_to :export
  belongs_to :product

  validates :quantity ,     presence: true
  validates :unit_price ,   presence: true

  after_create :export_product 

  def total_price
    quantity * unit_price
  end

  def export_product
    product.quantity = product.quantity - quantity
    product.save
  end
end