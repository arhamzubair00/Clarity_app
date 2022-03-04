class DaysController < ApplicationController
  #before_action :authenticate_user, only: [:show]

  def index
    # @days = Day.all
    @days = Day.select { |day| day.user_id == 1} # "2" should be replaced by some kind of user validation from devise.
    @days.sort_by { |day| day.calendar_date }
  end

  def show
    @day = Day.find(params[:id])
    @tasks = Task.select { |task| task.day == @day}
    @task = Task.new
    @mood = Mood.find { |mood| mood.day == @day}
  end
end
