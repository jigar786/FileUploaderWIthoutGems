class RemoveIndexFromUserFiles < ActiveRecord::Migration[5.1]
  def change
    remove_index :user_files, [:id, :user_id]
  end
end
