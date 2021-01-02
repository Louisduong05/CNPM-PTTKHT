class ImportedItem < ApplicationRecord
  extend Enumerize

  belongs_to :import
  belongs_to :product
  belongs_to :warehouse

  validates :quantity,     presence: true
  validates :unit_price,   presence: true
  validates :quantity,     numericality: { greater_than: 0 }
  validates :unit_price,   numericality: { greater_than: 0 }
  validate :check_worehouse

  before_validation :add_warehouse
  after_create :import_products

  def total_price
    quantity * unit_price
  end

  def add_warehouse
    self.warehouse_id = Warehouse.first.id
  end

  def import_products
    product.original_price = unit_price
    product.quantity += quantity
    product.save

    warehouse.current = plus_current_warehouse.to_i
    warehouse.save
  end

  def check_worehouse
    return false if product.blank?
    return if warehouse.capacity.to_i - plus_current_warehouse >= 0
    
    errors.add(:quantity, ':The current warehouse does not have enough spaceh')
    false
  end
end