class Cat < ApplicationRecord
  has_many :booking, dependent: :destroy
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :name, :description, :address, :age, :price_per_day, presence: true
end
