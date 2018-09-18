class ExportedItem < ApplicationRecord
  belongs_to :export
  belongs_to :product 
end