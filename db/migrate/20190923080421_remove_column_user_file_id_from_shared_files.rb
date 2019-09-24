class RemoveColumnUserFileIdFromSharedFiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :shared_files, :user_file_id
    remove_column :shared_files, :user_id_id
  end
end
