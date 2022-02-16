class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(id: current_user.id)
  end

  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar_image, :introduction,:avatar_image_cache, :nick_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar_image, :introduction,:avatar_image_cache, :nick_name])
  end
end
