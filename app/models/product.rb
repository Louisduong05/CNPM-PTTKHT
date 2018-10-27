class Product < ApplicationRecord
  has_many :exported_items
  has_many :imported_items
  belongs_to :brand

	validates :name,	presence: true
	validates :original_price,	presence: true
	validates :quantity,	presence: false
  def tax
    0.12
  end

  def total_price
    quantity * unit_price_with_tax
  end

  def unit_price_with_tax
    original_price * tax + original_price
  end
end