class AddUserToUserFiles < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_files, :user, foreign_key: true
  end

  add_index :user_files, [:id, :user_id], unique: true
end
