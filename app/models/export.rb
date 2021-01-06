class Export < ApplicationRecord
  belongs_to :user
  has_many :exported_items, dependent: :destroy
  belongs_to :customer
  has_one :pay, as: :pay_type

  accepts_nested_attributes_for :exported_items, allow_destroy: true

  enum status: ['temporary', 'official', 'cancel']

  after_create :create_pay
  after_save :cancel_pay, if: -> { cancel? }

  def total_price
    sum = 0
      
    exported_items.each do |i|
      sum = sum + i.total_price
    end
    
    sum
  end

  def create_pay
    code = SecureRandom.urlsafe_base64(3, false)
    Pay.create(code: "#{code}exp#{id}", pay_type_id: id, user_id: user_id, pay_type_type: 'Export')
  end

  def cancel_pay
    exported_items.each do |exported_item|
      update_product_and_warehouse(exported_item)
    end
  end

  def update_product_and_warehouse(exported_item)
    exported_item.product.quantity += exported_item.quantity
    exported_item.product.save
    minus_current_warehouse(exported_item)
  end

  private

  def minus_current_warehouse(exported_item)
    warehouse = Warehouse.first
    warehouse.current =
      warehouse.current + exported_item.product.size*exported_item.quantity
    warehouse.save
  end
end
