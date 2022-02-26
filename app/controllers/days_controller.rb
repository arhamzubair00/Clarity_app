class DaysController < ApplicationController
  #before_action :authenticate_user, only: [:show]

  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
    @tasks = Task.select { |task| task.day == @day}
    @tasks.sort_by{ |task| task.id }
  end
end
