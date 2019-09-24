class AddFilenameToUserFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :user_files, :filename, :string
    add_column :user_files, :data, :binary
  end
end
