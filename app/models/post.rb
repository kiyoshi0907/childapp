class Post < ApplicationRecord
  belongs_to :user
  
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 255 }, unless: :image?
  validates :image, presence: true, unless: :content?
  
  mount_uploader :image, ImageUploader
  
  
end
