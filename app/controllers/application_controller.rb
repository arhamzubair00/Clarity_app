class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname])
  end

  def after_sign_in_path_for(resource)
    days_path
    # @current_day = Day.where("calendar_date == #{Date.today}")
    # raise
    # @mood = Mood.where("day_id == #{@current_day.id}")
    # if @mood.mood_name == ''
    #   redirect_to edit_mood_path
    # else
    #   days_path
    # end
  end

end
