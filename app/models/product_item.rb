class ProductItem < ApplicationRecord
  extend Enumerize

  belongs_to :exported_item, optional: true
  belongs_to :imported_item
  belongs_to :product
  belongs_to :user

  validates :code, presence: true, uniqueness: { scope: :product_id }

  enumerize :status, in: ["Good", "Bad"], default: "Good"
  after_create :import_product

  def import_product
    product.quantity = product.quantity + 1
    product.save
    if imported_item.quantity == imported_item.product_items.count
      imported_item.status = 'Done'
      imported_item.save
    end
  end
end