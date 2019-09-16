class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "You are successfully logged in"
      redirect_to user
    else
      flash[:danger] = "Invalid email/password combination"
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You have successfully logged out."
    redirect_to root_url
  end

  def new
  end
end
