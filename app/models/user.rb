class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable     

  has_many :exports
  has_many :imports
  has_many :notifications 

  enumerize :type, in: ["User", "Admin", "Importer", "Exporter"], default: "User"

  def name
    "#{firstname}"
  end
end
