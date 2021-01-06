class Import < ApplicationRecord
  belongs_to :user
  has_many :imported_items, dependent: :destroy
  has_one :pay, as: :pay_type
  belongs_to :supplier

  enum status: ['temporary', 'official', 'cancel']

  accepts_nested_attributes_for :imported_items, allow_destroy: true
  before_save :import_products, on: :update
  after_create :create_pay

  def name
    "Nhập hàng #{id}"
  end

  def import_products
    if status == 'official'
      imported_items.each do |item|
        item.product.original_price = item.unit_price
        item.product.quantity += item.quantity
        item.product.save

        item.warehouse.current = plus_current_warehouse(item).to_i
        item.warehouse.save
      end
    end
  end

  def total_price
    sum = 0
      
    imported_items.each do |i|
      sum = sum + i.total_price
    end
    
    sum
  end

  def create_pay
    code = SecureRandom.urlsafe_base64(3, false)
    Pay.create!(code: "#{code}imp#{id}", pay_type_id: id, user_id: user_id, pay_type_type: 'Import')
  end

  private

  def plus_current_warehouse(item)
    item.warehouse.current.to_i + item.product.size*item.quantity
  end

end
