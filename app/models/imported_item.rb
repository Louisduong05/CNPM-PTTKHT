class ImportedItem < ApplicationRecord
  belongs_to :import
  belongs_to :product 
end