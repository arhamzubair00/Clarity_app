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
    if @task.save
      redirect_to day_path(@day)
    else
      #if the task doesnt save, reload the new task page
      @tasks = Task.where(day: selected_day)
      render 'days/show'
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

  def select_day_from_date
    @day = Day.find_by(calendar_date: params[:selected_date])
    render json: "{\"DayID\": #{@day.id}}"
  end

  def all_tasks
    # @tasks = Day.joins(:tasks)
    # @tasks.each do |d|
    #   puts d.tasks
    # end
    # render json: @tasks.to_json()

    res = ActiveRecord::Base.connection.execute("SELECT
      calendar_date,
      day_id,
      COUNT(*) AS total,
      COUNT(*) FILTER (WHERE status IS TRUE) AS total_done,
      JSON_AGG(title) AS task_titles
      FROM tasks
      JOIN days ON days.id = tasks.day_id
      GROUP BY calendar_date, day_id
      ORDER BY calendar_date")

    render json: res.to_json()
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
