class MoodsController < ApplicationController

  #Index
  def index
    @moods = Mood.all
  end

  #New
  def new
    @mood = Mood.new
    @day = current_day
  end

  #Create
  def create
    @mood = Mood.new(mood_params)
    @day = current_day
    @mood.day = @day
    if @mood.save!
    # redirect_to restaurant_path(@restaurant)
    else
      #if the mood doesnt save, reload the new mood page
      render :new
    end
  end

  #Edit
  def edit
    @mood = Mood.find(params[:id])
  end

  #Update
  def update
    @mood = Mood.find(params[:id])
    @mood.update(params[:mood])
  end


  #Strong params
   private

   def mood_params
     params.require(:mood).permit(:mood_name, :mood_notes)
   end

   def current_day
     @current_day = Day.find(:calendar_date == Date.today)
   end

end
