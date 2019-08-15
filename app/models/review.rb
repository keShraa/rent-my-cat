class Review < ApplicationRecord
  belongs_to :cat

  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, presence: true
  validates :cat_id, presence: true
end
