class Product < ApplicationRecord
	belongs_to :supplier
  has_many :exported_items

	validates :name,	presence: true
	validates :price,	presence: true
	validates :quantity,	presence: true
	validates :country,	presence: true
end