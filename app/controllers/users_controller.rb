class UsersController < ApplicationController
  def show
    # @tweets = Tweet.where(user_id:params[:id])
    @user = User.find(params[:id])
    @tweets = Tweet.page(params[:page]).where(user_id:params[:id]).per(10).order("created_at DESC")
  end

  def following
  end

  def followers
  end

end
