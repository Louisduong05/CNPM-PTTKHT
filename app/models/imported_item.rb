class ImportedItem < ApplicationRecord
  extend Enumerize

  belongs_to :import
  belongs_to :product
  belongs_to :warehouse
  has_many :product_items

  validates :quantity,     presence: true
  validates :unit_price,   presence: true
  validates :quantity,     numericality: { greater_than: 0 }
  validates :unit_price,   numericality: { greater_than: 0 }
  validate :check_worehouse

  accepts_nested_attributes_for :product_items, allow_destroy: true

  before_validation :add_warehouse
  after_create :import_products

  enumerize :status, in: ["Done", "Undone"], default: "Undone"

  def total_price
    quantity * unit_price
  end

  def excess_amount
    quantity - product_items.count
  end

  def add_warehouse
    self.warehouse_id = Warehouse.first.id
  end

  def import_products
    product.original_price = unit_price
    product.save

    warehouse.current = plus_current_warehouse.to_i
    warehouse.save
  end

  def check_worehouse
    return if warehouse.capacity.to_i - plus_current_warehouse >= 0
    errors.add(:base, 'not enough')
    false
  end

  private

  def plus_current_warehouse
    warehouse.current.to_i + product.size*quantity
  end
end