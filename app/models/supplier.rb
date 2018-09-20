class Supplier < ApplicationRecord
  has_many :imports

  validates :name, presence: true
end
