class SchedulesController < ApplicationController
  def index
    @q = Schedule.ransack(params[:q])
    @schedules = @q.result(distinct: true).order(fixed_day: :asc).page(params[:schedule_page]).per(10)
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
