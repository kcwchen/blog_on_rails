class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, presence: :true
  validates :password, presence: :true, :if => :password
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def full_name
    "#{first_name} #{last_name}"
  end
end
