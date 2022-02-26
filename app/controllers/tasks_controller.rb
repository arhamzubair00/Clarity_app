class TasksController < ApplicationController
  #before_action :authenticate_user
  def new
    @task = Task.new
    @day = selected_day
  end

  def create
    @task = Task.new(task_params)
    @day = selected_day
    @task.day = @day
    if @task.save!
      redirect_to day_path(@day)
    else
      #if the task doesnt save, reload the new task page
      render :new
    end
  end

  def edit
    @day = selected_day
    @task = Task.find(params[:id])
  end

  def update
    @day = selected_day
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to day_path(@day)
  end

  def destroy
    @task = Task.find(params[:id])
    @day = selected_day
    @task.destroy
    redirect_to day_path(@day)
  end

  private

  def task_params
    params.require(:task).permit(:title, :status)
  end

  def selected_day
    @current_day = Day.find(params[:day_id])
  end

  def confirm_delete
    @task = Task.find(params[:id])
    @task.destroy
  end
end
