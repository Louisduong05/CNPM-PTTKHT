class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png"
  has_many :exported_items
  has_many :imported_items
  belongs_to :brand

	validates :name, :size,	:original_price, presence: true
	validates :name, uniqueness: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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