class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :body, length: { minimum: 50 }
end
