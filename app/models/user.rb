class User < ApplicationRecord
  has_many :cats, :bookings, dependent: :destroy

  validates :first_name, :last_name, :email, :password, :address, presence:true
end
