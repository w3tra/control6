class Image < ApplicationRecord
  belongs_to :user
  has_many :image_comments, dependent: :destroy
  mount_uploader :picture, PictureUploader

  validates :title, presence: true, length: {maximum: 40}
  validates :picture, presence: true
  validates :user, presence: true

  def rating
  	if self.image_comments.any?
	  	sum = 0
	  	self.image_comments.each do |comment|
	  		sum = sum + comment.rating
	  	end
	  	rating = (sum.to_f/self.image_comments.count).round(2)
	  else
	  	rating = 0
	  end
  end
end
