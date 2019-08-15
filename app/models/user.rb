class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :age, inclusion: { }
  validates :first_name, :last_name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

  has_many :cats
  has_many :booking, dependent: :destroy
end
