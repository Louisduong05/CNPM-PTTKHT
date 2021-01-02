class Import < ApplicationRecord
  belongs_to :user
  has_many :imported_items, dependent: :destroy 
  belongs_to :supplier

  enum status: ['temporary', 'official', 'cancel']

  accepts_nested_attributes_for :imported_items, allow_destroy: true
  after_save :import_products

  def name
    "IMPORT_#{id}"
  end

  def import_products
    if status == 'official'
      imported_items.each do |item|
        item.product.original_price = item.unit_price
        item.product.quantity += item.quantity
        item.product.save

        item.warehouse.current = plus_current_warehouse(item).to_i
        item.warehouse.save
      end
    end
  end

  def total_price
    sum = 0
      
    imported_items.each do |i|
      sum = sum + i.total_price
    end
    
    sum
  end

  private

  def plus_current_warehouse(item)
    item.warehouse.current.to_i + item.product.size*item.quantity
  end

end
