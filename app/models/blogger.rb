class Blogger < ApplicationRecord
  	mount_uploader :blog_image, AvatarUploader
	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }
	has_rich_text :body
  	belongs_to :user
	has_many :likes
	has_many :comments, as: :commentable, dependent: :destroy
end
