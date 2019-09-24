class AddReferenceToSharedFiles < ActiveRecord::Migration[5.1]
  def change
    add_reference :shared_files, :user_file, foreign_key: true
  end
end
