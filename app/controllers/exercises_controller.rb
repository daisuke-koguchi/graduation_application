class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i{show edit update destroy}
  def index
    @exercises = Exercise.where(user_id: current_user.id)
    @schedules = Schedule.where(fixed_day: Date.today)
    
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
    @exercise.schedules.build
  end

  def update
    if @exercise.update(update_exercise_params)
      redirect_to exercises_path, notice: "運動内容を更新しました"
    else
      render :edit 
    end
  end

  def destroy
    @exercise.destroy 
    redirect_to exercises_path, notice: "運動内容を削除しました"
  end

  def graph
    @data = current_user.exercises.includes(:schedules).pluck(:fixed_day, :is_done)
    @result = []
    @data.sort {|a, b| a[0] <=> b[0] }.each do |data|
      if data[1] == true 
        data[1] = 1
      else
        data[1] = 0
      end
      @result.push(data[0].strftime("%m月%d日"),data[1])
    end
    @graph = @result.each_slice(2).to_a
  end

  private 
  def exercise_params
    params.require(:exercise).permit(:name, :description, :image,:video,
                                    :minute, :second, :count, :set_count,
                                    schedules_attributes: [
                                      :fixed_day, :is_done, :id])
  end

  def update_exercise_params
    params.require(:exercise).permit(:name, :description, :image,:video,
                                    :minute, :second, :count, :set_count,
                                    schedules_attributes: [
                                      :fixed_day, :is_done, :_destroy, :id])
  end

  def set_exercise 
    @exercise = Exercise.find(params[:id])
  end
end
