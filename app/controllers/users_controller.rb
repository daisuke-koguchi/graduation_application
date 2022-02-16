class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i{ index show }
  before_action :set_user, only: %i{ show }
  def top
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
