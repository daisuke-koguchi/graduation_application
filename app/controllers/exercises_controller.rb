class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i{show edit update destroy}
  before_action :current_user_permition, only: %i{edit show}
  def index
    @q = Exercise.where(user_id: current_user.id).ransack(params[:q])
    @exercises = @q.result(distinct: true).page(params[:page]).per(5)
    @schedules = Schedule.where(fixed_day: Date.today).page(params[:schedule_page]).per(5)
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
    @this_week_data = current_user.exercises.left_joins(:schedules).includes(:schedules).where(schedules: {is_done: true}).where(schedules: {fixed_day: Date.today.beginning_of_week..Time.now.end_of_week})
    @last_week_data = current_user.exercises.left_joins(:schedules).includes(:schedules).where(schedules: {is_done: true}).where(schedules: {fixed_day: (Date.today - 1.week).beginning_of_week..(Time.now - 1.week).end_of_week})
    @this_month_data = current_user.exercises.left_joins(:schedules).includes(:schedules).where(schedules: {is_done: true}).where(schedules: {fixed_day: Time.now.all_month})
  end

  private 
  def exercise_params
    params.require(:exercise).permit(:name, :description, :image,:video,
                                    :minute, :second, :count, :set_count,
                                    :nick_name,schedules_attributes: [
                                      :fixed_day, :is_done, :id])
  end

  def update_exercise_params
    params.require(:exercise).permit(:name, :description, :image,:video,
                                    :minute, :second, :count, :set_count,
                                    :nick_name,schedules_attributes: [
                                      :fixed_day, :is_done, :_destroy, :id])
  end

  def set_exercise 
    @exercise = Exercise.find(params[:id])
  end

  def current_user_permition 
    if current_user.id != @exercise.user_id 
      redirect_to exercises_path, alert: 'アクセスできません'
    end
  end
end
