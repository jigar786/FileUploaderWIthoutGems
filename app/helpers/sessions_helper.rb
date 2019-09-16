module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id]) #If you were to read it in words, you wouldn’t
      # say “If user id equals session of user id…”, but rather something like “If session
      # of user id exists (while setting user id to session of user id)…”.
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #   def is_logged_in?
  #     unless logged_in?
  #       flash[:danger] = "Kar nah login"
  #       redirect_to root_url
  #     end
  #   end
end
