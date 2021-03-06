class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  validates :name, presence: true,
            length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 30 },
            format: VALID_EMAIL_REGEX,
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true,
            length: { minimum: 4 }
end
