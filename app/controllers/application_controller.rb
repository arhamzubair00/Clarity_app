class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname])
  end

  def after_sign_in_path_for(resource)
    @current_day = Day.where(calendar_date: Date.today)
    @mood = Mood.where(day_id: @current_day, mood_name: "#")

    # raise

    if @mood.blank?
      days_path
    else
      edit_mood_path(find_mood_params)
    end

    # days_path
    # @current_day = Day.where("calendar_date == #{Date.today}")
    # # raise
    # @mood = Mood.where("day_id == #{@current_day.id}")
    # if @mood.mood_name == ''
    #   redirect_to days_path
    # else
    #   days_path
    # end
  end

  private

  def find_mood_params
    @mood.as_json.first["id"]
  end

end
