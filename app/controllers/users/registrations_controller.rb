class Users::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: %i[update destroy] 
    
    def confirm
      @user = User.new(sign_up_params)
      if @user.save 
        render :confirm
      else
        render :new
      end
    end
    
    def complete 
    end
    
    def destroy
        resource.soft_delete
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        set_flash_message :notice, :destroyed
        yield resource if block_given?
        respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    end

    def ensure_normal_user 
        if resource.email == 'guest@example.com'
            redirect_to root_path, alert: ゲストユーザーは編集・削除できません
        end
    end
end