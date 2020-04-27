class Warehouse < ApplicationRecord
  has_many :imported_items

  validates :name,        presence: true
  validates :current,     presence: true
  validates :capacity,    presence: true
end