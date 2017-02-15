class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :body, length: { maximum: 140 }

  def user_likes?(user)
    likes.where(user_id: user.id).present?
  end

  def json_tweet
    { id: id,
      body: body,
      created_at: created_at.to_s(:tweet),
      username: user.username,
      user_nickname: user.nickname,
      visible: user.visible?,
      user_id: user.id
    }
  end
end
