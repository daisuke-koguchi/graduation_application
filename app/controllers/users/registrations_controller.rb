class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_or_admin_user, only: %i[update destroy] 


  def create
    @user = User.new(sign_up_params)
    render :new and return if params[:back]
    super
  end
    
  def confirm
    @user = User.new(sign_up_params)
    if @user.valid?
      render :confirm
    end
  end
    
  def complete 
  end

  def after_inactive_sign_up_path_for(resource)
    users_sign_up_complete_path(resource)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  def destroy
      resource.soft_delete
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message :notice, :destroyed
      yield resource if block_given?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  def ensure_normal_or_admin_user 
    if resource.email == 'guest@example.com' || resource.email == 'admin_guest@example.com'
        redirect_to root_path, alert: "ゲストユーザーは編集・削除できません"
    end
  end

  protected
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end