class SchedulesController < ApplicationController
  def index 
    @schedules = Schedule.page(params[:schedule_page])
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
