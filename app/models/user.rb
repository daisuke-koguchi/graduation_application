class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 
  
  def soft_delete 
    update_attribute(:deleted_at, Time.current)
  end

  def active_for_authentication?
    super && !deleted_at
  end

  def inactive_message 
    !deleted_at ? super : :deleted_account 
  end
  
  def self.guest 
    find_or_create_by!(email: 'guest@example.com') do |user| 
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now 
      user.first_name = "ゲスト"
      user.last_name = "太郎"
      user.avatar_image = nil 
      user.introduction = "ゲストでログインします"
    end
  end
  mount_uploader :avatar_image, AvaterImageUploader
end
