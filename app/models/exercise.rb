class Exercise < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  def self.ransackable_attributes(auth_object = nil)
    %w(name)
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
