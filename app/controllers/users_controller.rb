class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i{ mypage index show }
  before_action :set_user, only: %i{ mypage show }
  def top
  end

  def mypage
    if @user.id !=  current_user.id
      redirect_to users_mypage_path(id: current_user.id), alert: "アクセス権限がありません" 
    end
  end
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show 
  end

  private 
  def set_user 
    @user = User.find(params[:id])
  end
end
