class RemoveDataFromUserFile < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_files, :data
  end
end
