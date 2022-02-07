class SchedulesController < ApplicationController
  def toggle 
    @schedule = Schedule.find(params[:id])
    @schedule.is_done = !@schedule.is_done
    @schedule.save
  end
end
