class SharedFilesController < ApplicationController
  before_action :logged_in_user?, only: [:create, :destroy]

  def create
    if @user_file = SharedFile.find_by(:user_file_id => params[:id])
      @link = "#{ENV["SHARED_HOST"]}/shared_file/#{@user_file.user_file_id}/#{@user_file.filename}"
      render "shared_files/create"
    else
      shared_file = current_user.shared_files.build
      shared_file.filename = UserFile.find_by(id: params[:id]).filename
      shared_file.user_file = UserFile.find_by(id: params[:id])
      @link = "#{ENV["SHARED_HOST"]}/shared_file/#{shared_file.user_file_id}/#{shared_file.filename}"
      shared_file.save
    end
  end

  def show
    if current_user.nil?
      flash[:danger] = "Please Log In"
      redirect_to login_path
    else
      shared_file = SharedFile.find_by(:user_file_id => params[:id])
      if shared_file.nil?
        return render file: "#{Rails.root}/public/404.html", status: 404
      else
        path = Rails.root.join("public_uploads", params[:id].to_s, shared_file.filename)
        send_file path
      end
    end
  end

  def destroy
    if current_user.user_files.where(id: params[:id])
      SharedFile.find_by(:user_file_id => params[:id]).destroy
      flash[:success] = "File successfully unshared"
      redirect_to current_user
    else
      flash[:danger] = "No Permissions"
      redirect_to current_user
    end
  end
end
