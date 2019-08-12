class Booking < ApplicationRecord
  belongs_to :user, :cat

  validates :starting_date, :ending_date, :total_price, pesence: true
end
