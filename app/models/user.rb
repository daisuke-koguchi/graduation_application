class User < ApplicationRecord
  has_many :exercises, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 
         
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    
    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

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
      user.admin = false 
    end
  end

  def self.admin_guest
    find_or_create_by(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now 
      user.first_name = "管理者ゲスト"
      user.last_name = "二郎"
      user.avatar_image = nil
      user.introduction = "管理者ゲストでログインします"
      user.admin = true 
    end
  end

  mount_uploader :avatar_image, AvaterImageUploader
end
