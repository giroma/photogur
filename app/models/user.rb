class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password, length: {minimum: 3, maximum: 20, message: "min 3   max 20 characters"}
  validates :email, uniqueness: true
end
