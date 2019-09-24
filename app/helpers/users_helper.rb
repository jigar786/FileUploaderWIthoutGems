module UsersHelper
  def user_name
    base_name = "File Uploader"
    if logged_in?
      base_name = current_user.name
    else
      base_name
    end
  end
end
