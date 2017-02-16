class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def show
    @tweets = Tweet.page(params[:page]).where(user_id:params[:id]).per(10).order("created_at DESC")
  end

  def following
    @users = @user.followed
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
