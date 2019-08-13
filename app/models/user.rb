class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :age, inclusion: { }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cats
  has_many :booking, dependent: :destroy
end
