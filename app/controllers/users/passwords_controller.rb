class Users::PasswordsController < Devise::PasswordsController
    before_action :ensure_normal_or_admin_user, only: :create
  
    def ensure_normal_or_admin_user
      if params[:user][:email].downcase == 'guest@example.com' || params[:user][:email].downcase == 'admin_guest@example.com'
        redirect_to new_user_session_path, alert: 'ゲストユーザーのパスワード再設定はできません。'
      end
    end
end