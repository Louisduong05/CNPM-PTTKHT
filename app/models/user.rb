class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable     

  has_many :exports
  has_many :imports 

  enumerize :type, in: ["User", "Admin", "Accountant", "Stocker"], default: "User"

  def name
    "#{firstname}"
  end
end
