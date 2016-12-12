class Post < ApplicationRecord
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user
end
