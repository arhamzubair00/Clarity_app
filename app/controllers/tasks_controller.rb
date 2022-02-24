class TasksController < ApplicationController

  def new
    @task = Task.new
    @day = selected_day
  end

  def create
    @task = Task.new(task_params)
    @day = selected_day
    @task.day = @day
    if @task.save!
      # redirect_to day_path(@day)
    else
      #if the task doesnt save, reload the new task page
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
  end

  def delete
    # @task = Task.find(params[:id])
    # @task.destroy
    #redirect_to
  end

  private

   def task_params
     params.require(:task).permit(:title)
   end

   def selected_day
     @current_day = Day.find(params[:day_id])
   end

   def confirm_delete
    @task = Task.find(params[:id])
    @task.destroy
   end
end
