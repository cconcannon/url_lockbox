class User < ApplicationRecord
  has_secure_password
  has_many :links

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
