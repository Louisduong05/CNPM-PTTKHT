class ExportedItem < ApplicationRecord
  belongs_to :export
  belongs_to :product

  validates :quantity ,     presence: true

  after_create :export_product 

  def total_price
    quantity * unit_price
  end

  def export_product
    product.quantity = product.quantity - quantity
    if(product.quantity < 0) 
      Importer.all.each do |importer|
        Notification.create(user: importer, link: "/products/#{product.id}", message: "Can nhap them san pham")
      end 
    end
    product.save
  end

  def unit_price
    product.unit_price_with_tax
  end
end
