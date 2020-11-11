class Export < ApplicationRecord
  belongs_to :user
  has_many :exported_items, dependent: :destroy
  belongs_to :customer

  accepts_nested_attributes_for :exported_items, allow_destroy: true

  def total_price
    sum = 0
      
    exported_items.each do |i|
      sum = sum + i.total_price
    end
    
    sum
  end
end
