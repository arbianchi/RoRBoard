class Board < ApplicationRecord
  has_many :users
  has_many :posts
  has_many :comments, through: :posts

  validates_presence_of :topic
  validates_length_of :topic, minimum: 2
end
