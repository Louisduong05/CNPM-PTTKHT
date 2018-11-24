class Customer < ApplicationRecord
  has_many :exports

  validates :name, presence: true
end