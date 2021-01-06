class Pay < ApplicationRecord
  include Enumerize
  belongs_to :pay_type, polymorphic: true
  belongs_to :user, optional: true

	validates :status, presence: true

  enum status: %i[temporary official cancel]
  enum payment_by: %i[momo bank cash]

  after_save :cancel_pay, on: :create, if: -> { cancel? }
  after_save :official_pay, on: :create, if: -> { official? }

  def cancel_pay
    pay_type.update(status: 'cancel')
  end

  def official_pay
    pay_type.update(status: 'official')
  end
end