class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.where(user_id: current_user.id)
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end
end
