class UsersController < ApplicationController
  before_action :logged_in_user?, only: [:show]

  def home
    @user = User.new
  end

  def index
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
    # debugger
  end

  private

  def get_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
