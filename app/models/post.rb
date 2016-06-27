class Post < ApplicationRecord
  has_many :comments
  belongs_to :board
  belongs_to :user
  acts_as_votable

  def votes
    upvote.size - downvote.size
  end
end
