class Brand < ApplicationRecord
  acts_as_paranoid
  has_many :products

  validates :name, presence: true

  after_save :update_is_active_products

  def update_is_active_products
    return unless is_active_changed?
    return if is_active

    products.each do |product|
      product.update(is_active: false)
    end
  end
end