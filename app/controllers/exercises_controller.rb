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
    @exercise = current_user.exercises.build(exercise_params)
    @exercise.save!
    redirect_to exercises_path 
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to exercises_path, notine: "編集しました"
    else
      render edit 
    end
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :image,:video,
                                    :minute, :second, :count, :set_count)
  end
end
