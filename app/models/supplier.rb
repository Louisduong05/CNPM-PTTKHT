class Supplier < ApplicationRecord
  has_many :imports
  has_many :imported_items, through: :imports

  validates :name, presence: true, uniqueness: true
end
