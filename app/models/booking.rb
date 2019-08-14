class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat
  enum status: %i[pending accepted refused]

  validates :starting_date, :ending_date, :total_price, presence: true
  validate :starting_date_cannot_be_in_the_past

  def starting_date_cannot_be_in_the_past
    starting_date.present? && starting_date < Date.today ? errors.add(:starting_date, "can't be in the past") : nil
  end
end
