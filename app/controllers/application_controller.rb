class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :format_time

  private
  # Getter method for current user
  def current_user
    @current_user ||= Reporter.find_by(uid: session[:uid])
  end
  # Setter method for current user
  def current_user=(reporter)
    session[:uid] = reporter.uid
    session[:name] = reporter.name
  end

  def user_signed_in?
   !!current_user
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to login_url, notice: "Please log in first"
    end
  end

# Getter method for format time

    def time_display(datetime)
        datetime.strftime("%m/%d/%Y, %l:%M %p")
    end

end
