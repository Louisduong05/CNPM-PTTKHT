class ExportedItems < ApplicationRecord
  belongs_to :export
  has_many :products  
end
