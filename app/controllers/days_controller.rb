class DaysController < ApplicationController
  #resources :day, only: [:index, :show]
  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
  end
end
