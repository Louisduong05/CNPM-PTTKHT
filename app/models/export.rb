class Export < ApplicationRecord
  belongs_to :user
  has_many :exported_items

  accepts_nested_attributes_for :exported_items

  def name
    user.type   
  end

  def total_price
    sum = 0
    
    exported_items.each do |i|
      sum = sum + i.total_price
    end

    sum
  end
end
