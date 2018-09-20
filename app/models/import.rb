class Import < ApplicationRecord
  belongs_to :user
  has_many :imported_items

  accepts_nested_attributes_for :imported_items

  def name
    "IMPORT_#{id}"
  end

  def total_price
    sum = 0
      
    imported_items.each do |i|
      sum = sum + i.total_price
    end
    
    sum
  end

end
