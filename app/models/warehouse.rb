class Warehouse < ApplicationRecord
  has_many :imported_items

  validates :name,        presence: true
  validates :current,     presence: true
  validates :capacity,    presence: true

  after_update :check_current

  def check_current
    if current.to_f/capacity.to_f > 0.9
      Admin.all.each do |admin|
        Notification.create(user: admin, link: "/warehouses", message: "Nhà kho sắp đầy")
      end
    end
  end
end