class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @tweets = Tweet.page(params[:page]).where(user_id:params[:id]).per(10).order("created_at DESC")
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followed
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

end
