class Pay < ApplicationRecord
  include Enumerize

  belongs_to :export
  belongs_to :user, optional: true

	validates :export_id, :status, presence: true

  enum status: %i[temporary official cancel]
  enum payment_by: %i[momo bank cash]

  after_save :cancel_pay, on: :create, if: -> { cancel? }

  def cancel_pay
    export.exported_items.each do |exported_item|
      update_product_and_warehouse(exported_item)
    end
  end

  def update_product_and_warehouse(exported_item)
    exported_item.product.quantity += exported_item.quantity
    exported_item.product.save
    minus_current_warehouse(exported_item)
  end

  private

  def minus_current_warehouse(exported_item)
    warehouse = Warehouse.first
    warehouse.current =
      warehouse.current + exported_item.product.size*exported_item.quantity
    warehouse.save
  end
end