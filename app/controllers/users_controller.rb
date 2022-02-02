class UsersController < ApplicationController
  before_action :set_user, only: %i{mypage}

  def top
    # if user_signed_in?
    #   redirect_to mypage_path
    # end
  end

  def mypage
  end
  
  def set_user 
     @user = User.find(params[:id])
  end
end
