class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # dependent: :destroy will delete all the
  # comments associated witht the post if the
  # post gets deleted
end
