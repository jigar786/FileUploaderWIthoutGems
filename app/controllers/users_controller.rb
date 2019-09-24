class UsersController < ApplicationController
  before_action :logged_in_user?, only: [:show]

  def home
    if logged_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(get_params)
    if @user.save
      flash.now[:success] = "Welcome!"
      log_in(@user)
      redirect_to @user
    else
      render "home"
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      return render file: "#{Rails.root}/public/404.html", status: 404
    elsif @user.id == current_user.id
      @files = @user.user_files
    else
      return render file: "#{Rails.root}/public/404.html", status: 404
    end

    # debugger
  end

  private

  def get_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
