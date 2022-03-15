class DaysController < ApplicationController
  #before_action :authenticate_user, only: [:show]

  def index

    # @days = Day.all
#     @days = Day.select { |day| day.user_id == 1} # "2" should be replaced by some kind of user validation from devise.
#     @days.order(:calendar_date) # use .order (active record) bc .sort_by is ruby code and the object is and active record reference

    @days = Day.all

end

  def show
    @day = Day.find(params[:id])
    @tasks = Task.where(day: @day)
    @task = Task.new
    # @mood = Mood.find { |mood| mood.day == @day}
  end

end
