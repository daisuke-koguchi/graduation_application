class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 
  
  def self.guest 
    find_or_create_by!(email: 'guest@example.com') do |user| 
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.admin = true 
    end
  end
  mount_uploader :avatar_image, AvaterImageUploader
end
