class ExportedItem < ApplicationRecord
  belongs_to :export
  belongs_to :product

  validates :quantity ,     presence: true
  validates :unit_price ,   presence: true

  after_create :export_product 

  def tax
    0.12
  end

  def total_price
    quantity * unit_price_with_tax
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

  def unit_price_with_tax
    unit_price * tax + unit_price
  end
end
