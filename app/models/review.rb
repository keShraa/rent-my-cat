class Review < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :description, length: { minimum: 20 }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, presence: true
  validates :cat_id, presence: true
end
