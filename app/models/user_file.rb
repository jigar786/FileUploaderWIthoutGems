class UserFile < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :filename, presence: true
end
