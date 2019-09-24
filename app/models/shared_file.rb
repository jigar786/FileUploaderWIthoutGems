class SharedFile < ApplicationRecord
  belongs_to :user
  belongs_to :user_file
  validates :user_file_id, presence: true
end
