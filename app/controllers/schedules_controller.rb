class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: %i{index create destroy}
  def index
    @q = Schedule.order(fixed_day: :asc).includes(:exercise).where(exercises: {user_id: current_user.id}).ransack(params[:q])
    @schedules = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def create
    @schedule = Schedule.find(params[:id])
    @schedule.is_done = !@schedule.is_done
    @schedule.save
    @massage = "運動を登録しました。運動の記録を確認してみましょう！"
  end

  def destroy 
    @schedule = Schedule.find(params[:id])
    @schedule.is_done = !@schedule.is_done
    @schedule.save
  end
end
