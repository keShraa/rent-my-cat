class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  validates :starting_date, :ending_date, :total_price, presence: true
  validate :starting_date_cannot_be_in_the_past

  def starting_date_cannot_be_in_the_past
    if starting_date.present? && starting_date < Date.today
      errors.add(:starting_date, "can't be in the past")
    end
  end
end
