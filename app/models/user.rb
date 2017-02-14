class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nickname, presence: true, uniqueness: true,
                       length: { maximum: 20, minimum: 4 }, format: { with: /\A[a-zA-Z\d\s.-]*\z/ }
  validates :username, presence: true, uniqueness: true,
                       length: { maximum: 20, minimum: 4 }, format: { with: /\A[a-zA-Z\d\s.-]*\z/ }
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 100 }
  validates :password, presence: true,
                       length: { maximum: 8, minimum: 4 }, format: { with: /\A[a-zA-Z\d\s]*\z/ }
  validates :password_confirmation, presence: true,
                                    length: { maximum: 8, minimum: 4 }, format: { with: /\A[a-zA-Z\d\s]*\z/ }
  enum visibility: { visible: 0, hidden: 1 }
  has_many :tweets
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followed, through: :active_relationships
  has_many :followers, through: :passive_relationships

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followed.include?(other_user)
  end
end
