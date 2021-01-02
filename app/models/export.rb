class Export < ApplicationRecord
  belongs_to :user
  has_many :exported_items, dependent: :destroy
  belongs_to :customer
  has_one :pay

  accepts_nested_attributes_for :exported_items, allow_destroy: true

  after_save :create_pay, on: :create

  def total_price
    sum = 0
      
    exported_items.each do |i|
      sum = sum + i.total_price
    end
    
    sum
  end

  def create_pay
    code = SecureRandom.urlsafe_base64(nil, false)
    Pay.create(code: "#{code}#{id}", export_id: id)
  end
end
