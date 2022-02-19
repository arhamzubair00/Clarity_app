class MoodsController < ApplicationController

  #Index
  def index
    @moods = Mood.all
  end

  #New
  def new
    @mood = Mood.new
  end

  #Create
  def create
    @mood = Mood.new(mood_params)
    #mood belongs to day
    @mood.day = current_day
  end

  #Edit
  def edit
  end

  #Update
  def update
  end


  #Strong params
   private

   def mood_params
     params.require(:mood).permit(:mood_name)
   end

   def current_day
     @current_day = Day.find(:calendar_date == Date.today)
   end

end
