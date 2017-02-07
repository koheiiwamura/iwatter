class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nickname, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  enum visibility: { visible: 0, hidden: 1 }
end
