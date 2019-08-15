class Cat < ApplicationRecord
  BREEDS = ["Main Coon", "Bengal", "Birman", "Burmese", "Chartreux",
            "Persian", "Ragdoll", "Abyssinian", "Oriental Shorthair", "Sphynx", "Devon Rex",
            "British shorthair", "Himalayen", "Ocicat", "Somali", "Javanais"].sort

  GENDER = ["Male", "Female"]

  CITY = ["Bordeaux", "Paris", "Lille", "Lyon", "Marseille", "Toulouse", "Dijon",
          "Strasbourg", "Brest", "Montpellier"].sort

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :user
  enum status: %i[available unavailable]
  mount_uploader :photo, PhotoUploader

  validates :name, :description, :address, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price_per_day, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :gender, presence: true
end
