class Exports < ApplicationRecord
  belongs_to :user
  has_many :exported_items
end
