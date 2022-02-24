class DaysController < ApplicationController
  before_action :authenticate_user, only: [:show]
  #resources :day, only: [:index, :show]
  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
  end
end
