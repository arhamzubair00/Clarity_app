class MoodsController < ApplicationController

  #Index
  def index
    @moods = Mood.all
    # instead of displaying all the moods,
    # @min_range = 1
    # @max_range = 10
    # @moods = Mood.find(@min_range..@max_range)
    # when the next page button is clicked, it should change
    # min_range and max_range to +10
    # previous button on the next page - just does the opposit of ^^ (minuses)
    # previous button hidden until we are on next poage
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
    #redirect_to day_path(@day)
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
    @mood.update(mood_params)
    if @mood.save!
      redirect_to days_path
    else
      #if the mood doesnt save, reload the new mood page
      render :edit
    end
  end

  def get_moods_by_date
    res = ActiveRecord::Base.connection.execute("SELECT JSON_OBJECT_AGG(calendar_date, mood_name) AS all_moods FROM moods
    JOIN days ON days.id = moods.day_id
    WHERE mood_name != '#';")
    puts res.to_json()
    render json: res.to_json()
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
