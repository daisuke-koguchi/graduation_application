class SchedulesController < ApplicationController
  def index
    @q = Schedule.order(fixed_day: :asc).includes(:exercise).where(exercises: {user_id: current_user.id}).ransack(params[:q])
    @schedules = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def create
    @schedule = Schedule.find(params[:id])
    @schedule.is_done = !@schedule.is_done
    @schedule.save
  end

  def destroy 
    @schedule = Schedule.find(params[:id])
    @schedule.is_done = !@schedule.is_done
    @schedule.save
  end
end
