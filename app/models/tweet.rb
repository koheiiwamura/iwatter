class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :body, length: { maximum: 140 }

  def user_likes?(user)
    likes.where(user_id: user.id).present?
  end

  def json_tweet
    {body: body}
  end
end
