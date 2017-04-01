class ImageComment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :body, presence: true, length: {maximum: 50}
  validates :rating, presence: true, length: {in: 1..5}
end
