class Cat < ApplicationRecord
  has_many :booking, dependent: :destroy
  belongs_to :user

  validation :name, :description, :address, :age, :price_per_day, presence: true
end
