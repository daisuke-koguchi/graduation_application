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

  def create 
    @exercise = Exercise.new(exercise_params)
  end

  def edit
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :image,:video,
                                    :minute, :second, :count, :set_count)
  end
end
