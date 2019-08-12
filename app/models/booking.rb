class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  validates :starting_date, :ending_date, :total_price, presence: true
end
