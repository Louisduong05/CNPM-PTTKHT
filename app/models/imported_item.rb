class ImportedItem < ApplicationRecord
  belongs_to :import
  belongs_to :product 

  validates :quantity ,     presence: true
  validates :unit_price ,   presence: true

  after_create :import_product

  def import_product
    product.quantity = product.quantity + quantity
    product.save
  end
end