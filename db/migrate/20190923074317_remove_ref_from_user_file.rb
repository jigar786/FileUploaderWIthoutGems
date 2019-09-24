class RemoveRefFromUserFile < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_files, :user_file_id
    add_reference :shared_files, :user, foreign_key: true
  end
end
