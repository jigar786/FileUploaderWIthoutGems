class CreateSharedFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :shared_files do |t|
      t.references :user_file, foreign_key: true
      t.string :filename

      t.timestamps
    end
  end
end
