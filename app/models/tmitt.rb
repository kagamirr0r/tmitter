class Tmitt < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :liked, through: :favorites, source: :user
end
