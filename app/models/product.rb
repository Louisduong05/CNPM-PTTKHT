class Product < ApplicationRecord
	belongs_to :supplier
  has_many :exported_items
  has_many :imported_items
  belongs_to :brand

	validates :name,	presence: true
	validates :price,	presence: true
	validates :quantity,	presence: false

end