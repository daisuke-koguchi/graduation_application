class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i{show edit update destroy}
  def index
    @exercises = Exercise.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @exercise = Exercise.new
    @exercise.schedules.build

  end

  def create 
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save 
      redirect_to exercises_path, notice: "運動内容を登録しました"
    else
      render :new 
    end 
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: "運動内容を更新しました"
    else
      render :edit 
    end
  end

  def destroy
    @exercise.destroy 
    redirect_to exercises_path, notice: "運動内容を削除しました"
  end

  private 
  def exercise_params
    params.require(:exercise).permit(:name, :description, :image,:video,
                                    :minute, :second, :count, :set_count,
                                    schedules_attributes: [
                                      :fixed_day, :is_done, :id])
  end

  def set_exercise 
    @exercise = Exercise.find(params[:id])
  end
end
