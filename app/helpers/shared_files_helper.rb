module SharedFilesHelper
  def sharing_enabled?(file_id)
    !SharedFile.find_by(user_file_id: file_id).nil?
  end
end
