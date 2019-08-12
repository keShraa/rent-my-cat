class Booking < ApplicationRecord
  belongs_to :user_id
  belongs_to :cat_id
end
