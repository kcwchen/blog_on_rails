class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :password, presence :true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
