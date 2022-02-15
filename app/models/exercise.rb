class Exercise < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  
  validates :name, presence: true, length:{in: 1..50}
  
  def self.ransackable_attributes(auth_object = nil)
    %w(nick_name)
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  def self.default_timezone
    :utc
  end
end
