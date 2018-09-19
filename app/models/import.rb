class Import < ApplicationRecord
  belongs_to :user
  has_many :imported_items
end
