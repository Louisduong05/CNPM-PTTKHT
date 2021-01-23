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

  def total_price
    quantity * unit_price
  end

  def add_warehouse
    self.warehouse_id = Warehouse.first.id
  end

  def check_worehouse
    return false if product.blank?
    return if warehouse.capacity.to_i - plus_current_warehouse >= 0
    
    errors.add(:quantity, ':Kho không đủ chỗ chứa')
    false
  end

  def plus_current_warehouse
    warehouse.current.to_i + product.size*quantity
  end
end