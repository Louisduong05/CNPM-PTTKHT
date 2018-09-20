class Import < ApplicationRecord
  belongs_to :user
  has_many :imported_items

  def name
    "IMPORT_#{id}"
  end

end
