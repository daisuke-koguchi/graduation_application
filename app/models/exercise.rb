class Exercise < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true 
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
