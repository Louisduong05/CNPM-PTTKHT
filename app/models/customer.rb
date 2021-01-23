class Customer < ApplicationRecord
  has_many :exports
  has_many :exported_items, through: :exports

  validates :name, presence: true, uniqueness: true
end