class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true

  has_many :exports
  has_many :imports
  has_many :notifications 
  has_many :product_items

  enumerize :type, in: ["User", "Admin", "Staff"], default: "User"

  def name
    "#{firstname}"
  end

  def active_for_authentication?
    super && is_active
  end
end
