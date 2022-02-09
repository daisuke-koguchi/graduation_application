class UsersController < ApplicationController

  def top
  end

  def mypage
    @user = User.find(params[:id])
  end
  
  def index 
    @users = User.all.page(params[:page])
  end

  def show 
    @user = User.find(params[:id])
  end

end
