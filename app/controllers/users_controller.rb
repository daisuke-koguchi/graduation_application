class UsersController < ApplicationController

  def top
  end

  def mypage
    @user = User.find(params[:id])
  end
  
end
