class User < ApplicationRecord
  has_many :user_files, dependent: :destroy
  has_many :shared_files, dependent: :destroy
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50, minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    # uniqueness: { case_sensitive: false }
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def posts
    UserFile.where("user_id = ?", id)
  end
end
