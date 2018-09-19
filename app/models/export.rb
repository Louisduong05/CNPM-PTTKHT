class Export < ApplicationRecord
  belongs_to :user
  has_many :exported_items

  def name
    "EXPORT_#{id}" 
  end
end
