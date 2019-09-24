class UserFilesController < ApplicationController
  before_action :logged_in_user?, only: [:create, :destroy, :download]

  def create
    @user_files = current_user.user_files.build(userfiles_params)
    @user_files.filename = params[:user_files][:filename].original_filename
    uploaded_io = params[:user_files][:filename].tempfile
    if @user_files.save
      upload_files(@user_files, uploaded_io)

      flash[:success] = "File Uploaded"
      redirect_to current_user
    else
      flash[:danger] = "File already exists"
      redirect_to current_user
    end
  end

  def destroy
    item = UserFile.find_by(id: params[:id])
    if item.nil?
      return render file: "#{Rails.root}/public/404.html", status: 404
    elsif item && current_user.user_files.where(id: item.id)
      item.destroy
      flash[:success] = "File Deleted"
      redirect_to current_user
    else
      return render file: "#{Rails.root}/public/404.html", status: 404
    end
  end

  def download
    item = UserFile.find_by(id: params[:id])
    if item.nil?
      return render file: "#{Rails.root}/public/404.html", status: 404
    elsif item && current_user.user_files.where(id: params[:id])
      path = Rails.root.join("public_uploads", params[:id], item.filename.to_s)
      send_file path
    else
      flash[:danger] = "URL not found"
      redirect_to current_user
    end
  end

  private

  def upload_files(user_file, uploaded_io)
    path = Rails.root.join("public_uploads", user_file.id.to_s)
    Dir.mkdir(path) unless Dir.exist?(path)
    File.open(path.join(user_file.filename), "wb") { |f| f.write(uploaded_io.read) }
  end

  def userfiles_params
    params.require(:user_files).permit(:name, :filename)
  end
end
