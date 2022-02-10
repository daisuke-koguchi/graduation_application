class UsersController < ApplicationController

  def top
  end

  def mypage
    @user = User.find(params[:id])
  end
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def show 
    @user = User.find(params[:id])
  end

end
