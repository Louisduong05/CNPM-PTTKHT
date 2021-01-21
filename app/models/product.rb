class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png"
  has_many :exported_items
  has_many :imported_items

	validates :name, :size,	:original_price, presence: true
	validates :name, uniqueness: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def tax
    0.1
  end

  def interest
    0.02
  end

  def total_price
    quantity * unit_price_with_tax
  end

  def unit_price_with_tax
    original_price * tax + original_price*interest + original_price
  end

  def unit_price_with_interest
    original_price*interest + original_price
  end

  def export_offi
    exported_items.includes(export: :pay).select do |exported_item|
      exported_item.export&.pay&.status == 'official'
    end
  end

  def import_offi
    imported_items.includes(:import).select do |imported_item|
      imported_item.import.status == 'official'
    end
  end
end